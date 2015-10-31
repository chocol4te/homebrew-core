class Libcroco < Formula
  desc "CSS parsing and manipulation toolkit for GNOME"
  homepage "http://www.linuxfromscratch.org/blfs/view/svn/general/libcroco.html"
  url "https://download.gnome.org/sources/libcroco/0.6/libcroco-0.6.9.tar.xz"
  sha256 "38b9a6aed1813e55b3ca07a68d1af845ad4d1f984602e9272fe692930c0be0ae"

  bottle do
    cellar :any
    sha256 "b088109aef1501e32cb4bedf65807ebe0f4d14492b310308d10d3af98c867b48" => :el_capitan
    sha256 "a7068d12230f2efc87159f09c369b18ea80c6a21273f5fc79677236301aeaef9" => :yosemite
    sha256 "0941b2151777aec8e20df74979185a5fb2aa0794d009a24aa83011e12946e490" => :mavericks
    sha256 "13ee66e3ce36c2728c3120984db89cae4268d9bcfa48446a75bb026ebedde513" => :mountain_lion
  end

  depends_on "pkg-config" => :build
  depends_on "intltool" => :build
  depends_on "glib"

  def install
    ENV.libxml2
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--disable-Bsymbolic"
    system "make", "install"
  end

  test do
    (testpath/"test.css").write ".brew-pr { color: green }"
    assert_equal ".brew-pr {\n  color : green\n}",
      shell_output("#{bin}/csslint-0.6 test.css").chomp
  end
end
