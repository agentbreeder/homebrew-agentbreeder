class Agentbreeder < Formula
  include Language::Python::Virtualenv

  desc "Define Once. Deploy Anywhere. Govern Automatically — CLI for AgentBreeder"
  homepage "https://agentbreeder.io"
  url "https://files.pythonhosted.org/packages/65/27/4a74a5770bba6268e146a82067675d68d1ecd76adc1b1febba567d03ab5e/agentbreeder-2.7.2.tar.gz"
  sha256 "01030ca0938adff2367f5f04126fa11dc98402f86ae861dbaed1653063162336"
  license "Apache-2.0"
  head "https://github.com/agentbreeder/agentbreeder.git", branch: "main"

  bottle do
    # Bottles generated automatically via CI — do not edit manually.
  end

  depends_on "python@3.11"

  # Core SDK (pulled as a dep by agentbreeder, listed here so Homebrew
  # resolves it within the virtualenv without hitting PyPI recursively).
  resource "agentbreeder-sdk" do
    url "https://files.pythonhosted.org/packages/59/71/d64042af7c8c0a1825d9e732b6191250f2a05c8021bc288ca1eb6a8c80e9/agentbreeder_sdk-2.7.2.tar.gz"
    sha256 "060531302e5982ea8e9e49aaa785e8672225248042ddfd7bed8a6d19f475f353"
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
