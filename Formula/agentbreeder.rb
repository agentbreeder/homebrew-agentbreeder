class Agentbreeder < Formula
  include Language::Python::Virtualenv

  desc "Define Once. Deploy Anywhere. Govern Automatically — CLI for AgentBreeder"
  homepage "https://agentbreeder.io"
  url "https://files.pythonhosted.org/packages/08/91/4fb8f631c744501a150ea6b963128804891648706711dc33e02cd821325f/agentbreeder-2.7.1.tar.gz"
  sha256 "daa22d4e034ae726ff8f31b801a0dcce829328376275520dcff8c63735494986"
  license "Apache-2.0"
  head "https://github.com/agentbreeder/agentbreeder.git", branch: "main"

  bottle do
    # Bottles generated automatically via CI — do not edit manually.
  end

  depends_on "python@3.11"

  # Core SDK (pulled as a dep by agentbreeder, listed here so Homebrew
  # resolves it within the virtualenv without hitting PyPI recursively).
  resource "agentbreeder-sdk" do
    url "https://files.pythonhosted.org/packages/28/a6/ee572cd61f09406a95298bba7726bafd1c710956a91c3f4eced57fdf225c/agentbreeder_sdk-2.7.1.tar.gz"
    sha256 "2314aad91500f5dfd362c2414d3b25f1ebad79b0d96e203ec50dad7431ae029e"
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
