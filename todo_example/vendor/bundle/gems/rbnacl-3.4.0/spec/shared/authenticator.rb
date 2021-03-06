# encoding: binary
RSpec.shared_examples "authenticator" do
  let(:key)     { vector "auth_key_#{described_class.key_bytes}".to_sym }
  let(:message) { vector :auth_message }

  context ".new" do
    it "accepts a key" do
      expect { described_class.new(key) }.to_not raise_error
    end

    it "requires a key" do
      expect { described_class.new }.to raise_error(ArgumentError)
    end

    it "raises TypeError on a nil key" do
      expect { described_class.new(nil) }.to raise_error(TypeError)
    end

    it "raises ArgumentError on a key which is too long" do
      expect { described_class.new("\0" * described_class.key_bytes.succ) }.to raise_error(ArgumentError)
    end

    it "raises ArgumentError on a key which is too short" do
      expect { described_class.new("\0" * described_class.key_bytes.pred) }.to raise_error(ArgumentError)
    end
  end

  context ".auth" do
    it "produces an authenticator" do
      expect(described_class.auth(key, message)).to eq tag
    end

    it "raises TypeError on a nil key" do
      expect { described_class.auth(nil, message) }.to raise_error(TypeError)
    end

    it "raises ArgumentError on a key which is too long" do
      expect { described_class.auth("\0" * described_class.key_bytes.succ, message) }.to raise_error(ArgumentError)
    end
  end

  context ".verify" do
    it "verify an authenticator" do
      expect(described_class.verify(key, tag, message)).to eq true
    end

    it "raises TypeError on a nil key" do
      expect { described_class.verify(nil, tag, message) }.to raise_error(TypeError)
    end

    it "raises ArgumentError on a key which is too long" do
      expect { described_class.verify("\0" * described_class.key_bytes.succ, tag, message) }.to raise_error(ArgumentError)
    end

    it "fails to validate an invalid authenticator" do
      expect { described_class.verify(key, tag, message + "\0") }.to raise_error(RbNaCl::BadAuthenticatorError)
    end

    it "fails to validate a short authenticator" do
      expect { described_class.verify(key, tag[0, tag.bytesize - 2], message) }.to raise_error(RbNaCl::LengthError)
    end

    it "fails to validate a long authenticator" do
      expect { described_class.verify(key, tag + "\0", message) }.to raise_error(RbNaCl::LengthError)
    end
  end

  context "Instance methods" do
    let(:authenticator) { described_class.new(key) }

    context "#auth" do
      it "produces an authenticator" do
        expect(authenticator.auth(message)).to eq tag
      end
    end

    context "#verify" do
      it "verifies an authenticator" do
        expect(authenticator.verify(tag, message)).to be true
      end

      it "fails to validate an invalid authenticator" do
        expect { authenticator.verify(tag, message + "\0") }.to raise_error(RbNaCl::BadAuthenticatorError)
      end

      it "fails to validate a short authenticator" do
        expect { authenticator.verify(tag[0, tag.bytesize - 2], message) }.to raise_error(RbNaCl::LengthError)
      end

      it "fails to validate a long authenticator" do
        expect { authenticator.verify(tag + "\0", message) }.to raise_error(RbNaCl::LengthError)
      end
    end
  end
end
