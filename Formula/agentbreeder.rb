class Agentbreeder < Formula
  include Language::Python::Virtualenv

  desc "Define Once. Deploy Anywhere. Govern Automatically — CLI for AgentBreeder"
  homepage "https://agentbreeder.io"
  url "https://files.pythonhosted.org/packages/31/17/c66a41ace86b82c32ab65e8782bdff31c0179f804b92124ca4426f0c760d/agentbreeder-2.6.0.tar.gz"
  sha256 "5abc65ba0a94cbedf2bf624c2ed42a1746ed741ba30478159076d99b9b70a38d"
  license "Apache-2.0"
  head "https://github.com/agentbreeder/agentbreeder.git", branch: "main"

  bottle do
    # Bottles generated automatically via CI — do not edit manually.
  end

  depends_on "python@3.11"

  # Core SDK (pulled as a dep by agentbreeder, listed here so Homebrew
  # resolves it within the virtualenv without hitting PyPI recursively).
  resource "agentbreeder-sdk" do
    url "https://files.pythonhosted.org/packages/4d/c0/07b33b83c9ba1420e0630c57fe8dcfa4331cacfcf3c1503d6b747043b99b/agentbreeder_sdk-2.6.0.tar.gz"
    sha256 "d590a97ef557e4ebddf21fb202a6f58a2e825f139ca545e3eefe0348468084b3"
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
