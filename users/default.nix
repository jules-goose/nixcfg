self:
{
    matthew = import ./jules self; # pass 'self' in order to allow ./users/default.nix -> ./users/jules/default.nix to access ${self}, to provide a path relative to flake.nix.
}