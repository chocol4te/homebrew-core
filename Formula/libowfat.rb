class Libowfat < Formula
  desc "Reimplements libdjb"
  homepage "https://www.fefe.de/libowfat/"
  url "https://dl.fefe.de/libowfat-0.29.tar.bz2"
  sha256 "4badbdeed6bef4337f1edd6b86fb7154c5592509c272dcdc09c693161cbc6427"
  head ":pserver:cvs:@cvs.fefe.de:/cvs", :using => :cvs

  bottle do
    cellar :any_skip_relocation
    rebuild 2
    sha256 "4be1305b60bb8f5d3e283d58f3d8649b98289946c5abf55c42fb174c00ed5e8e" => :high_sierra
    sha256 "07d058c654a42d34821399ff800dfa22e928a64bcba4f465443197fe4168e97a" => :sierra
    sha256 "b8f9b6f14ef4ca9e703ef458659604738f2f6b11899fb9546d8764dde47de4c0" => :el_capitan
    sha256 "f84024088302c6452f32f2398d0c39a59ee7f2a2eda117e516608e0299763dda" => :yosemite
    sha256 "a05b57c64730e4780012a06b61224a63e492173e3d6fa191516e408e9578a105" => :mavericks
  end

  def install
    system "make", "libowfat.a"
    system "make", "install", "prefix=#{prefix}", "MAN3DIR=#{man3}", "INCLUDEDIR=#{include}/libowfat"
  end
end
