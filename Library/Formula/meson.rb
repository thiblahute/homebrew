class Meson < Formula
  desc "Fast and user friendly build system"
  homepage "http://mesonbuild.com/"
  url "https://github.com/mesonbuild/meson/releases/download/0.29.0/meson-0.29.0.tar.gz"
  sha256 "ed98d9eae07bcc0039188a1f7d2ebc98d0261d6a06c389ad1898887b78337d71"

  depends_on "python3"
  depends_on "ninja"

  def install
    ENV["PYTHONPATH"] = lib+"python3.5/site-packages"
    ENV.prepend_create_path "PYTHONPATH", libexec+"lib/python3.5/site-packages"

    resources.each do |r|
      r.stage { system "python3", "setup.py", "install", "--prefix=#{libexec}" }
    end

    system "python3", "setup.py", "install", "--single-version-externally-managed", "--record=installed.txt",
           "--prefix=#{prefix}"

    bin.env_script_all_files(libexec+"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end

  test do
    system "#{bin}/meson", "--version"
  end
end
