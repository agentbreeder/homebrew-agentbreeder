class Agentbreeder < Formula
  include Language::Python::Virtualenv

  desc "Define Once. Deploy Anywhere. Govern Automatically — CLI for AgentBreeder"
  homepage "https://agentbreeder.io"
  url "https://files.pythonhosted.org/packages/14/7a/0bcb884fa9acb430ba61270627a6a06324c8ce21a7f29a841bf7a28a87ef/agentbreeder-1.9.0.tar.gz"
  sha256 "8b5975263768714e55bc5e2f92b409b919c555c3ee91842b9e7b73d3e9e88b3c"
  license "Apache-2.0"
  head "https://github.com/agentbreeder/agentbreeder.git", branch: "main"

  bottle do
    # Bottles generated automatically via CI — do not edit manually.
  end

  depends_on "python@3.11"

  # Core SDK (pulled as a dep by agentbreeder, listed here so Homebrew
  # resolves it within the virtualenv without hitting PyPI recursively).
  resource "agentbreeder-sdk" do
    url "https://files.pythonhosted.org/packages/b6/1d/4a3c363e58f6654dacdf4a520a4f3cad9f52e3530a36059e51b2610f49a5/agentbreeder_sdk-1.9.0.tar.gz"
    sha256 "461d9b32f84a1cb7a22e0a8db442b76cdb40e5631fae67f4976ea7835bb0214b"
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
