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
        title = "Vodafone TV",
        version = "1.0",
        author = "Neukirchener",
        url = "https://github.com/Neukirchener/",
        shortdesc = "Vodafone TV",
        description = "Bietet eine Auswahl an Fernsehsendern zur Wiedergabe an.",
        capabilities = {}
    }
end

function activate()
    add_menu_entries()
end

function add_menu_entries()
    local d = vlc.dialog("Senderauswahl - Vodafone TV")
    d:add_label("Wähle einen Sender:", 1, 1, 4, 1)

    local channels = {
        {"ARD", 1}, {"ZDF", 2}, {"WDR", 3}, {"RTL", 4}, {"RTL II", 5}, {"RTL Super", 6},
        {"Pro 7", 7}, {"Sat.1", 8}, {"Kabel Eins", 9}, {"VOX", 10}, {"3SAT", 11}, 
        {"aplha", 12}, {"ONE", 13}, {"ARTE", 14}, {"BR", 15}, {"HR", 16}, {"MDR", 17},
        {"NDR", 18}, {"Phoenix", 19}, {"RBB", 20}, {"SR", 21}, {"SWR", 22}, {"ZDFinfo", 23},
        {"ZDFneo", 24}, {"Tagesschau 24", 25}, {"DMAX", 37}, {"Sport1", 38}, {"N-tv", 26},
        {"Tele5", 27}, {"Nickelodeon", 39}, {"NITRO", 28}, {"ANIXE", 29}, {"Eurosport", 30},
        {"Sat.1 Gold", 31}, {"Sixx", 32}, {"VIVA", 33}, {"KiKA", 34}, {"Euronews", 35},
        {"N24", 36}, {"QVC", 40}
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
        "rtp://@232.0.1.65:10000", "rtp://@232.0.1.66:10000", "rtp://@232.0.1.78:10000", 
        "rtp://@232.0.2.187:10000", "rtp://@232.0.2.191:10000", "rtp://@232.0.2.193:10000", 
        "rtp://@232.0.2.189:10000", "rtp://@232.0.2.192:10000", "rtp://@232.0.2.188:10000", 
        "rtp://@232.0.2.190:10000", "rtp://@232.0.1.75:10000", "rtp://@232.0.1.37:10370", 
        "rtp://@232.0.1.38:10380", "rtp://@232.0.1.67:10000", "rtp://@232.0.1.71:10000", 
        "rtp://@232.0.1.21:10210", "rtp://@232.0.1.17:10170", "rtp://@232.0.1.72:10000", 
        "rtp://@232.0.1.68:10000", "rtp://@232.0.1.22:10220", "rtp://@232.0.1.23:10230", 
        "rtp://@232.0.1.70:10000", "rtp://@232.0.1.77:10000", "rtp://@232.0.1.73:10000", 
        "rtp://@232.0.1.39:10390", "rtp://@232.0.2.195:10000", "rtp://@232.0.1.26:10000", 
        "rtp://@232.0.2.198:10000", "rtp://@232.0.1.83:10000", "rtp://@232.0.1.32:10000", 
        "rtp://@232.0.2.199:10000", "rtp://@232.0.2.197:10000", "rtp://@232.0.1.27:10270", 
        "rtp://@232.0.1.76:10000", "rtp://@232.0.1.50:10500", "rtp://@232.0.2.194:10000", 
        "rtp://@232.0.1.34:10340", "rtp://@232.0.1.28:10000", "rtp://@232.0.1.30:10300", 
        "rtp://@232.0.1.33:10330"
    }

    vlc.playlist.clear()
    vlc.playlist.add({{path = urls[id]}})
    vlc.playlist.play()
end
