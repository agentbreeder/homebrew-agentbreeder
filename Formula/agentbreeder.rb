class Agentbreeder < Formula
  include Language::Python::Virtualenv

  desc "Define Once. Deploy Anywhere. Govern Automatically — CLI for AgentBreeder"
  homepage "https://agent-breeder.com"
  url "https://files.pythonhosted.org/packages/a9/70/da8a48f0d788e95a682e0354187b05df6aa9ea7cc5c887ac20edb9b8ace8/agentbreeder-1.7.0.tar.gz"
  sha256 "74c6ee4afa7d39f787ad947dc14750198a96842fc7a6730170a5505f1d835a93"
  license "Apache-2.0"
  head "https://github.com/rajitsaha/agentbreeder.git", branch: "main"

  bottle do
    # Bottles generated automatically via CI — do not edit manually.
  end

  depends_on "python@3.11"

  # Core SDK (pulled as a dep by agentbreeder, listed here so Homebrew
  # resolves it within the virtualenv without hitting PyPI recursively).
  resource "agentbreeder-sdk" do
    url "https://files.pythonhosted.org/packages/05/b2/070b53f31e233e681520166adb38d5224ca0ff76ca2418cbcc9681d75dfc/agentbreeder_sdk-1.7.0.tar.gz"
    sha256 "20885d0008ad0f0b64fd705b2e0be80f2adc84b4fbbbe44fe19cb8ce3b25c8a9"
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
