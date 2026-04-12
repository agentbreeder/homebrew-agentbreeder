class Agentbreeder < Formula
  include Language::Python::Virtualenv

  desc "Define Once. Deploy Anywhere. Govern Automatically — CLI for AgentBreeder"
  homepage "https://agent-breeder.com"
  url "https://files.pythonhosted.org/packages/8c/62/000d00d1fbc755ec55ae5e4aeadeb1a59c56980cf1715fdb854baa6796c3/agentbreeder-1.4.0.tar.gz"
  sha256 "6a26685cad01bc5ff683fd0d50c0d375ee4cf16e94ba29c804f3c983e1c0a4b7"
  license "Apache-2.0"
  head "https://github.com/rajitsaha/agentbreeder.git", branch: "main"

  bottle do
    # Bottles generated automatically via CI — do not edit manually.
  end

  depends_on "python@3.11"

  # Core SDK (pulled as a dep by agentbreeder, listed here so Homebrew
  # resolves it within the virtualenv without hitting PyPI recursively).
  resource "agentbreeder-sdk" do
    url "https://files.pythonhosted.org/packages/5f/9f/90da0911bd132940f7544aa4c170c6d9b67b6849c681eed477705d10d368/agentbreeder_sdk-1.4.0.tar.gz"
    sha256 "97ee4bdb8f231f10b8decff83aa2dc67be86695e0d866a47f826adc2491f5957"
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
