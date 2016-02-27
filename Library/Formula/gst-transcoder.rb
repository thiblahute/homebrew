class GstTranscoder < Formula
  desc ""
  homepage ""
  url "https://github.com/pitivi/gst-transcoder/archive/1.6.0.tar.gz"
  version "1.6.0"
  sha256 "aef920c660b94937b6f1e681c673c28a15a2a82f26cd68cab9cb093ef0fa3a92"

  depends_on "meson"  => :build
  depends_on "ninja"  => :build
  depends_on "python3"
  depends_on "gstreamer"
  depends_on "gst-plugins-base"

  def install
    mkdir "build" do
      system "meson", "../", "--prefix=#{prefix}"
      system "ninja", "install"
    end
  end

  test do
    system "gst-transcoder-1.0", "--version"
  end
end
