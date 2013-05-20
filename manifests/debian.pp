# gpm service script on debian does not
# have a status cmd
class gpm::debian inherits gpm::base {
  Service[gpm]{
    hasstatus => false,
  }
}
