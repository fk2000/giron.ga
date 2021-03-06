require 'spec_helper'

def runnable?(file)
  !write_command_enabled? && (file.include?('bulkWrite') || file.include?('insert'))
end

describe 'Command Monitoring Events' do

  COMMAND_MONITORING_TESTS.each do |file|

    spec = Mongo::CommandMonitoring::Spec.new(file)

    spec.tests.each do |test|

      context(test.description) do

        let(:subscriber) do
          Mongo::CommandMonitoring::TestSubscriber.new
        end

        let(:monitoring) do
          authorized_client.instance_variable_get(:@monitoring)
        end

        before do
          authorized_collection.find.delete_many
          authorized_client.subscribe(Mongo::Monitoring::COMMAND, subscriber)
        end

        after do
          monitoring.subscribers[Mongo::Monitoring::COMMAND].delete(subscriber)
          authorized_collection.find.delete_many
        end

        test.expectations.each do |expectation|

          it "generates a #{expectation.event_name} for #{expectation.command_name}", unless: runnable?(file) do
            begin
              test.run(authorized_collection)
              event = subscriber.send(expectation.event_type)[expectation.command_name]
              expect(event).to send(expectation.matcher, expectation)
            rescue Mongo::Error::OperationFailure, Mongo::Error::BulkWriteError => e
              event = subscriber.send(expectation.event_type)[expectation.command_name]
              expect(event).to send(expectation.matcher, expectation)
            end
          end
        end
      end
    end
  end
end
