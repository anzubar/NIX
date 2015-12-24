{ 
   system ? builtins.currentSystem, 
   pkgs ? import ~/.nix-defexpr/channels/nixpkgs { inherit system;}, 
   stdenv ? pkgs.stdenv, 
   fetchurl ? pkgs.fetchurl,
   intltool ? pkgs.intltool,
   pkgconfig ? pkgs.pkgconfig,
   gtk ? pkgs.gtk2,
   libxml ? pkgs.libxml2,
   python ? pkgs.python
}:

stdenv.mkDerivation 
{
  name = "medit-1.2.0";
  src = fetchurl 
  {
    url = "http://downloads.sourceforge.net/project/mooedit/medit/1.2.0/medit-1.2.0.tar.bz2";
    sha256 = "0k9s3x71nqiahx88qj1qgd8xfl2210xgz8ksnajhfy9kwgcv7xzh";
  };
    buildInputs = [ intltool pkgconfig gtk libxml python ];
    #configureFlags = ["--disable-nls"];
}

