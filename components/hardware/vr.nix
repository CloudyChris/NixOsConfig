{ pkgs, ... }:
{
    services.monado = {
        enable = true;
    };

    services.wivrn = {
        enable = true;
        defaultRuntime = true;
        openFirewall = true;
    };

    programs.alvr = {
        enable = true;
        openFirewall = true;
    };

    systemd.user.services.monado.environment = {
        STEAMVR_LH_ENABLE = "1";
        XRT_COMPOSITOR_COMPUTE = "1";
    };
}
