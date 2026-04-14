class Agentbreeder < Formula
  include Language::Python::Virtualenv

  desc "Define Once. Deploy Anywhere. Govern Automatically — CLI for AgentBreeder"
  homepage "https://agent-breeder.com"
  url "https://files.pythonhosted.org/packages/1a/a5/7992d6f7ebc20e553430c1c2c3b2749fdb6020efc9ea4f35033df391d653/agentbreeder-1.5.0.tar.gz"
  sha256 "78e54a3afc8c56831deea29a7478276d061ad27e89cd41003abb7b149c772604"
  license "Apache-2.0"
  head "https://github.com/rajitsaha/agentbreeder.git", branch: "main"

  bottle do
    # Bottles generated automatically via CI — do not edit manually.
  end

  depends_on "python@3.11"

  # Core SDK (pulled as a dep by agentbreeder, listed here so Homebrew
  # resolves it within the virtualenv without hitting PyPI recursively).
  resource "agentbreeder-sdk" do
    url "https://files.pythonhosted.org/packages/81/01/6160a801e65a0ab406e91462279b81a2aa1fc917ad2c2be72abe64e8f00c/agentbreeder_sdk-1.5.0.tar.gz"
    sha256 "dfedf37b19d24c6c918fb86798ff8f074864b0ba4c4d5a4e68f907e1066d93f0"
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
