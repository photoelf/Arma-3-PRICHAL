class RscCompass
{
    idd = -1;
    duration = 1e+1000;
    fadein = 0;
    fadeout = 0;
    onLoad = "uiNamespace setVariable ['BLWK_compassHUD', _this select 0]";
    class controls
    {
        class CompassBackground: RscText
        {
            idc = 1200;
            x = "safeZoneX + safeZoneW / 2 - 0.3";
            y = "safeZoneY + 0.02";
            w = 0.6;
            h = 0.04;
            colorBackground[] = {0,0,0,0.5};
        };
        class CompassText: RscText
        {
            idc = 1201;
            style = 2;
            text = "";
            x = "safeZoneX + safeZoneW / 2 - 0.3";
            y = "safeZoneY + 0.02";
            w = 0.6;
            h = 0.04;
            sizeEx = 0.035;
        };
    };
};