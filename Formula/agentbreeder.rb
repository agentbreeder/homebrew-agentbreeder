class Agentbreeder < Formula
  include Language::Python::Virtualenv

  desc "Define Once. Deploy Anywhere. Govern Automatically — CLI for AgentBreeder"
  homepage "https://agentbreeder.io"
  url "https://files.pythonhosted.org/packages/40/3e/87929d5dda3fb2880a449c1f9d399e46f6797e9fdf9b6397922be3b57b7f/agentbreeder-2.0.1.tar.gz"
  sha256 "3c3847144dfe293dab8afe540c9d7280082c6728fb7c12c0bc39b7a2f981fc8c"
  license "Apache-2.0"
  head "https://github.com/agentbreeder/agentbreeder.git", branch: "main"

  bottle do
    # Bottles generated automatically via CI — do not edit manually.
  end

  depends_on "python@3.11"

  # Core SDK (pulled as a dep by agentbreeder, listed here so Homebrew
  # resolves it within the virtualenv without hitting PyPI recursively).
  resource "agentbreeder-sdk" do
    url "https://files.pythonhosted.org/packages/9e/a9/100c781f03638ed3fd0c025960492929a860e5986eafb45577bd17c0da22/agentbreeder_sdk-2.0.1.tar.gz"
    sha256 "60f61643e9c30de26ed9ca03c68909c6f733b52548e2477ee836fd7f6fa6f0f7"
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
