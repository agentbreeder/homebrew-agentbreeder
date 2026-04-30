class Agentbreeder < Formula
  include Language::Python::Virtualenv

  desc "Define Once. Deploy Anywhere. Govern Automatically — CLI for AgentBreeder"
  homepage "https://agentbreeder.io"
  url "https://files.pythonhosted.org/packages/a5/01/1f7cfef29bfa85aa60b2939bbc256f63d5921701cd1a18819e56a82eebfb/agentbreeder-2.1.0.tar.gz"
  sha256 "40d91908dcc8c51317202bbdc3cd022a53dfeb3c4571bfc4822275ad614fda5f"
  license "Apache-2.0"
  head "https://github.com/agentbreeder/agentbreeder.git", branch: "main"

  bottle do
    # Bottles generated automatically via CI — do not edit manually.
  end

  depends_on "python@3.11"

  # Core SDK (pulled as a dep by agentbreeder, listed here so Homebrew
  # resolves it within the virtualenv without hitting PyPI recursively).
  resource "agentbreeder-sdk" do
    url "https://files.pythonhosted.org/packages/3e/ee/027011a7fae0f1d255d6987463e07f2fe1cb23130e571ad11203838ff37e/agentbreeder_sdk-2.1.0.tar.gz"
    sha256 "91ee65d9f7d28fae53b23f4f39ca685e179b42d311958edb3d78b5a5fe99c224"
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
