class Agentbreeder < Formula
  include Language::Python::Virtualenv

  desc "Define Once. Deploy Anywhere. Govern Automatically — CLI for AgentBreeder"
  homepage "https://agentbreeder.io"
  url "https://files.pythonhosted.org/packages/3c/fc/ade41d1fc7320bbea3bf2b07ed6c79746cf09f80b27bac5f55455c443094/agentbreeder-2.7.3.tar.gz"
  sha256 "08dd19c49a1fb7103370e0c26d35021884b07966800fecf7d44ef19a9edddde3"
  license "Apache-2.0"
  head "https://github.com/agentbreeder/agentbreeder.git", branch: "main"

  bottle do
    # Bottles generated automatically via CI — do not edit manually.
  end

  depends_on "python@3.11"

  # Core SDK (pulled as a dep by agentbreeder, listed here so Homebrew
  # resolves it within the virtualenv without hitting PyPI recursively).
  resource "agentbreeder-sdk" do
    url "https://files.pythonhosted.org/packages/46/ab/53861988f74842298d637741275fc6a0eb1ded3d458e8914296ca0256d91/agentbreeder_sdk-2.7.3.tar.gz"
    sha256 "8d966795074bc38582af5ffb45201a406ddccfeb2a250836b75ca5fa31a8560d"
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
