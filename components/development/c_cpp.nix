{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    libgcc
    gdb
    cgdb
    libclang
    ccls
  ];
}
