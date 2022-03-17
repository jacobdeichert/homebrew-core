require "language/node"

class Cdk8s < Formula
  desc "Define k8s native apps and abstractions using object-oriented programming"
  homepage "https://cdk8s.io/"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-1.0.127.tgz"
  sha256 "c46fbe42ceeb7900040d7fc3c132af23a9da8442255fe75398d9a081435afed0"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "1b5c31bce5a4a5e6380ce23ec9ca4de659fca6e2c2f441dfba886be68e6da01c"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Cannot initialize a project in a non-empty directory",
      shell_output("#{bin}/cdk8s init python-app 2>&1", 1)
  end
end
