--[[
 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; either version 2 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program; if not, write to the Free Software
 Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301, USA.
--]]

function descriptor()
    return {
        title = "Magenta TV",
        version = "1.0",
        author = "Neukirchener",
        url = "https://github.com/Neukirchener/",
        shortdesc = "Magenta TV",
        description = "Bietet eine Auswahl an Fernsehsendern zur Wiedergabe an.",
        capabilities = {}
    }
end

function activate()
    add_menu_entries()
end

function add_menu_entries()
    local d = vlc.dialog("Senderauswahl - Magenta TV")
    d:add_label("Wähle einen Sender:", 1, 1, 4, 1)

    local channels = {
        {"ARD", 1}, {"ZDF", 2}, {"WDR", 3}, {"3SAT", 11}, {"aplha", 12}, {"ARTE", 14},
        {"BR Süd", 15}, {"HR", 16}, {"KiKA", 34}, {"MDR Sachsen", 17}, {"NDR", 18},
        {"ONE", 13}, {"Phoenix", 19}, {"RBB", 20}, {"SR", 21}, {"SWR BW", 22},
        {"Tagesschau 24", 25}, {"ZDFinfo", 23}, {"ZDFneo", 24}, {"Kabel Eins", 9},
        {"Kabel Eins Doku", 27}, {"N-tv", 26}, {"NITRO", 28}, {"RTL", 4},
        {"RTL II", 5}, {"RTL Super", 6}, {"RTL up", 30}, {"ProSieben", 7},
        {"ProSieben MAXX", 29}, {"Sat.1", 8}, {"Sat.1 Gold", 31}, {"Sixx", 32},
        {"Toggo plus", 33}, {"VOX", 10}, {"VOX up", 35}
    }

    for i, channel in ipairs(channels) do
        local col = ((i - 1) % 4) + 1
        local row = math.floor((i - 1) / 4) + 2
        d:add_button(channel[1], function() menu_action(channel[2]) end, col, row)
    end
end

function deactivate()
    close()
    vlc.msg.dbg('[TV] Deactivated')
    return true
end

function menu_action(id)
    local urls = {
        "rtp://87.141.215.251@232.0.20.35:10000", "rtp://87.141.215.251@232.0.20.234:10000",
        "rtp://87.141.215.251@232.0.20.222:10000", "rtp://87.141.215.251@232.0.10.135:10000",
        "rtp://87.141.215.251@232.0.10.140:10000", "rtp://87.141.215.251@232.0.10.201:10000",
        "rtp://87.141.215.251@232.0.10.120:10000", "rtp://87.141.215.251@232.0.10.146:10000",
        "rtp://87.141.215.251@232.0.10.82:10000", "rtp://87.141.215.251@232.0.10.221:10000",
        "rtp://87.141.215.251@232.0.20.2:10000", "rtp://87.141.215.251@232.0.20.9:10000",
        "rtp://87.141.215.251@232.0.20.49:10000", "rtp://87.141.215.251@232.0.20.10:10000",
        "rtp://87.141.215.251@232.0.20.26:10000", "rtp://87.141.215.251@232.0.20.71:10000",
        "rtp://87.141.215.251@232.0.20.93:10000", "rtp://87.141.215.251@232.0.20.104:10000",
        "rtp://87.141.215.251@232.0.20.116:10000", "rtp://87.141.215.251@232.0.20.129:10000",
        "rtp://87.141.215.251@232.0.20.200:10000", "rtp://87.141.215.251@232.0.20.202:10000",
        "rtp://87.141.215.251@232.0.20.237:10000", "rtp://87.141.215.251@232.0.20.236:10000",
        "rtp://87.141.215.251@232.0.20.205:10000", "rtp://87.141.215.251@232.0.10.111:10000",
        "rtp://87.141.215.251@232.0.11.2:10000", "rtp://87.141.215.251@232.0.10.143:10000",
        "rtp://87.141.215.251@232.0.10.122:10000", "rtp://87.141.215.251@232.0.10.240:10000",
        "rtp://87.141.215.251@232.0.10.149:10000", "rtp://87.141.215.251@232.0.10.157:10000",
        "rtp://87.141.215.251@232.0.11.7:10000", "rtp://87.141.215.251@232.0.20.85:10000",
        "rtp://87.141.215.251@232.0.10.239:10000"
    }

    vlc.playlist.clear()
    vlc.playlist.add({{path = urls[id]}})
    vlc.playlist.play()
end
