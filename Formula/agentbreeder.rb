class Agentbreeder < Formula
  include Language::Python::Virtualenv

  desc "Define Once. Deploy Anywhere. Govern Automatically — CLI for AgentBreeder"
  homepage "https://agent-breeder.com"
  url "https://files.pythonhosted.org/packages/4b/2e/83f792c01086407d9844ae0751b88f99c6748b9935ce789a71a257ee410b/agentbreeder-1.8.0.tar.gz"
  sha256 "cd21c104b135f36dec5aa3542aba8e2e3f8553875d4e899ac6d4d0ee0bba36de"
  license "Apache-2.0"
  head "https://github.com/rajitsaha/agentbreeder.git", branch: "main"

  bottle do
    # Bottles generated automatically via CI — do not edit manually.
  end

  depends_on "python@3.11"

  # Core SDK (pulled as a dep by agentbreeder, listed here so Homebrew
  # resolves it within the virtualenv without hitting PyPI recursively).
  resource "agentbreeder-sdk" do
    url "https://files.pythonhosted.org/packages/0e/df/dc1565e16669161a79ef471a22a601d0c3bb0858b00f60663514a5428afa/agentbreeder_sdk-1.8.0.tar.gz"
    sha256 "6df3a7775fdfa91997216b4683acea3193e97aed5d4b5cc59c251a30844f6bfe"
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
