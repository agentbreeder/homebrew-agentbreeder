class Agentbreeder < Formula
  include Language::Python::Virtualenv

  desc "Define Once. Deploy Anywhere. Govern Automatically — CLI for AgentBreeder"
  homepage "https://agentbreeder.io"
  url "https://files.pythonhosted.org/packages/6d/c7/575971ca93e038d6fb9b1b4139f84b1afee1499ca1ab55ec83fadfd87aad/agentbreeder-2.5.1.tar.gz"
  sha256 "499ceef34f1984b8a9dce9d7e3b92de189aef9ceda2928686e3ae7116472a805"
  license "Apache-2.0"
  head "https://github.com/agentbreeder/agentbreeder.git", branch: "main"

  bottle do
    # Bottles generated automatically via CI — do not edit manually.
  end

  depends_on "python@3.11"

  # Core SDK (pulled as a dep by agentbreeder, listed here so Homebrew
  # resolves it within the virtualenv without hitting PyPI recursively).
  resource "agentbreeder-sdk" do
    url "https://files.pythonhosted.org/packages/cb/09/aa94c10796453dea3071c745413985ef7b4a01e6dffc37ebc719ad3eb77b/agentbreeder_sdk-2.5.1.tar.gz"
    sha256 "e9147ab2c681ff02661190df74e4a1877ad9e75a716ca3934056fe2a9c7d0e84"
  end

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/source/P/PyYAML/PyYAML-6.0.2.tar.gz"
    sha256 "d584d9ec91ad65861cc08d42e834324ef890a082e591037abe114850ff7bbc3e"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "AgentBreeder", shell_output("#{bin}/agentbreeder --help")
    assert_match version.to_s, shell_output("#{bin}/agentbreeder --version")
  end
end
