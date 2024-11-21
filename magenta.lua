--[[
 Lua-Skript für VLC, um Fernsehsender von Magenta TV (IPTV), zu schauen.
 Speicherort:
 Windows: 	%APPDATA%\vlc\lua\extensions
 Linux: 	~/.local/share/vlc/lua/extensions
 macOS: 	/Users/<your_name>/Library/Application Support/org.videolan.vlc/lua/extensions
 
 Unter "Ansicht -> Magenta TV" können die Sender ausgewählt werden.
 
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
        author = "march",
        url = "http://example.com",
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
    
    d:add_label("Wähle einen Sender:", 1, 1, 4, 1)  -- Etikett über beiden Spalten
    
    -- Erste Spalte
    d:add_button("ARD", function() menu_action(1) end, 1, 2)
    d:add_button("ZDF", function() menu_action(2) end, 1, 3)    
    d:add_button("WDR", function() menu_action(3) end, 1, 4)
    d:add_button("RTL", function() menu_action(4) end, 1, 5)
    d:add_button("RTL II", function() menu_action(5) end, 1, 6)
    d:add_button("RTL Super", function() menu_action(6) end, 1, 7)    
    d:add_button("Pro 7", function() menu_action(7) end, 1, 8)
    d:add_button("Sat.1", function() menu_action(8) end, 1, 9)
    d:add_button("Kabel Eins", function() menu_action(9) end, 1, 10)
    
    -- Zweite Spalte
    d:add_button("VOX", function() menu_action(10) end, 2, 2)
    d:add_button("3SAT", function() menu_action(11) end, 2, 3)    
    d:add_button("aplha", function() menu_action(12) end, 2, 4)
    d:add_button("ONE", function() menu_action(13) end, 2, 5)
    d:add_button("ARTE", function() menu_action(14) end, 2, 6)
    d:add_button("BR", function() menu_action(15) end, 2, 7)    
    d:add_button("HR", function() menu_action(16) end, 2, 8)
    d:add_button("MDR", function() menu_action(17) end, 2, 9)
    d:add_button("NDR", function() menu_action(18) end, 2, 10)
    
    -- Dritte Spalte
    d:add_button("Phoenix", function() menu_action(19) end, 3, 2)
    d:add_button("RBB", function() menu_action(20) end, 3, 3)    
    d:add_button("SR", function() menu_action(21) end, 3, 4)
    d:add_button("SWR", function() menu_action(22) end, 3, 5)
    d:add_button("ZDFinfo", function() menu_action(23) end, 3, 6)
    d:add_button("ZDFneo", function() menu_action(24) end, 3, 7)    
    d:add_button("Tagesschau 24", function() menu_action(25) end, 3, 8)
    d:add_button("N-tv", function() menu_action(26) end, 3, 9)
    d:add_button("Kabel Eins Doku", function() menu_action(27) end, 3, 10)
    
    -- Vierte Spalte
    d:add_button("NITRO", function() menu_action(28) end, 4, 2)
    d:add_button("ProSieben MAXX", function() menu_action(29) end, 4, 3)    
    d:add_button("RTL up", function() menu_action(30) end, 4, 4)
    d:add_button("Sat.1 Gold", function() menu_action(31) end, 4, 5)
    d:add_button("Sixx", function() menu_action(32) end, 4, 6)
    d:add_button("Toggo plus", function() menu_action(33) end, 4, 7)    
    d:add_button("KiKA", function() menu_action(34) end, 4, 8)
    d:add_button("Vox up", function() menu_action(35) end, 4, 9)
    
end

function deactivate()
    -- Hier kommt der Code, um das Skript zu deaktivieren
    	close()
	vlc.msg.dbg('[TV] Deactivated')
	return true
end

function menu_action(id)
    if id == 1 then
        vlc.playlist.clear()
        vlc.playlist.add({{path = "rtp://87.141.215.251@232.0.20.35:10000"}})
        vlc.playlist.play()
    elseif id == 2 then
        vlc.playlist.clear()
        vlc.playlist.add({{path = "rtp://87.141.215.251@232.0.20.234:10000"}})
        vlc.playlist.play()
    elseif id == 3 then
        vlc.playlist.clear()
        vlc.playlist.add({{path = "rtp://87.141.215.251@232.0.20.222:10000"}})
        vlc.playlist.play()
    elseif id == 4 then
        vlc.playlist.clear()
        vlc.playlist.add({{path = "rtp://87.141.215.251@232.0.10.135:10000"}})
        vlc.playlist.play()
    elseif id == 5 then
        vlc.playlist.clear()
        vlc.playlist.add({{path = "rtp://87.141.215.251@232.0.10.140:10000"}}) 
        vlc.playlist.play()
    elseif id == 6 then
        vlc.playlist.clear()
        vlc.playlist.add({{path = "rtp://87.141.215.251@232.0.10.201:10000"}})
        vlc.playlist.play()
    elseif id == 7 then
        vlc.playlist.clear()
        vlc.playlist.add({{path = "rtp://87.141.215.251@232.0.10.120:10000"}})
        vlc.playlist.play()
    elseif id == 8 then
        vlc.playlist.clear()
        vlc.playlist.add({{path = "rtp://87.141.215.251@232.0.10.146:10000"}})
        vlc.playlist.play()
    elseif id == 9 then
        vlc.playlist.clear()
        vlc.playlist.add({{path = "rtp://87.141.215.251@232.0.10.82:10000"}})
        vlc.playlist.play()
    elseif id == 10 then
        vlc.playlist.clear()
        vlc.playlist.add({{path = "rtp://87.141.215.251@232.0.10.221:10000"}})
        vlc.playlist.play()
    elseif id == 11 then
        vlc.playlist.clear()
        vlc.playlist.add({{path = "rtp://87.141.215.251@232.0.20.2:10000"}})   
        vlc.playlist.play()
    elseif id == 12 then
        vlc.playlist.clear()
        vlc.playlist.add({{path = "rtp://87.141.215.251@232.0.20.9:10000"}})
        vlc.playlist.play()
    elseif id == 13 then
        vlc.playlist.clear()
        vlc.playlist.add({{path = "rtp://87.141.215.251@232.0.20.49:10000"}})
        vlc.playlist.play()
    elseif id == 14 then
        vlc.playlist.clear()
        vlc.playlist.add({{path = "rtp://87.141.215.251@232.0.20.10:10000"}})
        vlc.playlist.play()
    elseif id == 15 then
        vlc.playlist.clear()
        vlc.playlist.add({{path = "rtp://87.141.215.251@232.0.20.26:10000"}}) -- Nord rtp://87.141.215.251@232.0.10.25:10000  Süd rtp://87.141.215.251@232.0.10.26:10000
        vlc.playlist.play()
    elseif id == 16 then
        vlc.playlist.clear()
        vlc.playlist.add({{path = "rtp://87.141.215.251@232.0.20.71:10000"}}) 
        vlc.playlist.play()
    elseif id == 17 then
        vlc.playlist.clear()
        vlc.playlist.add({{path = "rtp://87.141.215.251@232.0.20.93:10000"}}) -- Sachsen rtp://87.141.215.251@232.0.10.93:10000  Thüringen rtp://87.141.215.251@232.0.10.95:10000
        vlc.playlist.play()
    elseif id == 18 then
        vlc.playlist.clear()
        vlc.playlist.add({{path = "rtp://87.141.215.251@232.0.20.104:10000"}})
        vlc.playlist.play()
    elseif id == 19 then
        vlc.playlist.clear()
        vlc.playlist.add({{path = "rtp://87.141.215.251@232.0.20.116:10000"}})
        vlc.playlist.play()
    elseif id == 20 then
        vlc.playlist.clear()
        vlc.playlist.add({{path = "rtp://87.141.215.251@232.0.20.129:10000"}})
        vlc.playlist.play()
    elseif id == 21 then
        vlc.playlist.clear()
        vlc.playlist.add({{path = "rtp://87.141.215.251@232.0.20.200:10000"}})
        vlc.playlist.play()
    elseif id == 22 then
        vlc.playlist.clear()
        vlc.playlist.add({{path = "rtp://87.141.215.251@232.0.20.202:10000"}}) --BW rtp://87.141.215.251@232.0.10.202:10000  RP rtp://87.141.215.251@232.0.10.203:10000
        vlc.playlist.play()
    elseif id == 23 then
        vlc.playlist.clear()
        vlc.playlist.add({{path = "rtp://87.141.215.251@232.0.20.237:10000"}})
        vlc.playlist.play()
    elseif id == 24 then
        vlc.playlist.clear()
        vlc.playlist.add({{path = "rtp://87.141.215.251@232.0.20.236:10000"}}) 
        vlc.playlist.play()
    elseif id == 25 then
        vlc.playlist.clear()
        vlc.playlist.add({{path = "rtp://87.141.215.251@232.0.20.205:10000"}})
        vlc.playlist.play()
    elseif id == 26 then
        vlc.playlist.clear()
        vlc.playlist.add({{path = "rtp://87.141.215.251@232.0.10.111:10000"}})
        vlc.playlist.play()
    elseif id == 27 then
        vlc.playlist.clear()
        vlc.playlist.add({{path = "rtp://87.141.215.251@232.0.11.2:10000"}}) 
        vlc.playlist.play()
    elseif id == 28 then
        vlc.playlist.clear()
        vlc.playlist.add({{path = "rtp://87.141.215.251@232.0.10.143:10000"}})
        vlc.playlist.play()
    elseif id == 29 then
        vlc.playlist.clear()
        vlc.playlist.add({{path = "rtp://87.141.215.251@232.0.10.122:10000"}})
        vlc.playlist.play()
    elseif id == 30 then
        vlc.playlist.clear()
        vlc.playlist.add({{path = "rtp://87.141.215.251@232.0.10.240:10000"}})
        vlc.playlist.play()
    elseif id == 31 then
        vlc.playlist.clear()
        vlc.playlist.add({{path = "rtp://87.141.215.251@232.0.10.149:10000"}})
        vlc.playlist.play()
    elseif id == 32 then
        vlc.playlist.clear()
        vlc.playlist.add({{path = "rtp://87.141.215.251@232.0.10.157:10000"}})
        vlc.playlist.play()
    elseif id == 33 then
        vlc.playlist.clear()
        vlc.playlist.add({{path = "rtp://87.141.215.251@232.0.11.7:10000"}}) 
        vlc.playlist.play()
    elseif id == 34 then
        vlc.playlist.clear()
        vlc.playlist.add({{path = "rtp://87.141.215.251@232.0.20.85:10000"}})
        vlc.playlist.play() 
    elseif id == 35 then
        vlc.playlist.clear()
        vlc.playlist.add({{path = "rtp://87.141.215.251@232.0.10.239:10000<"}}) 
        vlc.playlist.play()
	end
end
