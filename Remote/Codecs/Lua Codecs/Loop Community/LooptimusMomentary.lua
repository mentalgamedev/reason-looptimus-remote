-- Looptimus Momentary - Reason Remote codec v1.0.0
--
-- The Looptimus notes are intentionally exposed as VALUE controls rather than
-- BUTTON controls.
--
-- Why:
-- Reason Remote may treat a "button" as an edge-trigger/toggle-style control
-- and ignore the release value (0) for many target parameters. Warp's
-- footswitch controls need both states to arrive.
--
-- This codec therefore sends:
--   Note On  -> value 127
--   Note Off -> value 0
--
-- All incoming MIDI channels are accepted.

function remote_init()
    local items = {
        {name="Bank 01 A - C-2 (000)", input="value", min=0, max=127},
        {name="Bank 01 B - C#-2 (001)", input="value", min=0, max=127},
        {name="Bank 01 C - D-2 (002)", input="value", min=0, max=127},
        {name="Bank 01 D - D#-2 (003)", input="value", min=0, max=127},
        {name="Bank 01 E - E-2 (004)", input="value", min=0, max=127},
        {name="Bank 01 F - F-2 (005)", input="value", min=0, max=127},
        {name="Bank 02 A - F#-2 (006)", input="value", min=0, max=127},
        {name="Bank 02 B - G-2 (007)", input="value", min=0, max=127},
        {name="Bank 02 C - G#-2 (008)", input="value", min=0, max=127},
        {name="Bank 02 D - A-2 (009)", input="value", min=0, max=127},
        {name="Bank 02 E - A#-2 (010)", input="value", min=0, max=127},
        {name="Bank 02 F - B-2 (011)", input="value", min=0, max=127},
        {name="Bank 03 A - C-1 (012)", input="value", min=0, max=127},
        {name="Bank 03 B - C#-1 (013)", input="value", min=0, max=127},
        {name="Bank 03 C - D-1 (014)", input="value", min=0, max=127},
        {name="Bank 03 D - D#-1 (015)", input="value", min=0, max=127},
        {name="Bank 03 E - E-1 (016)", input="value", min=0, max=127},
        {name="Bank 03 F - F-1 (017)", input="value", min=0, max=127},
        {name="Bank 04 A - F#-1 (018)", input="value", min=0, max=127},
        {name="Bank 04 B - G-1 (019)", input="value", min=0, max=127},
        {name="Bank 04 C - G#-1 (020)", input="value", min=0, max=127},
        {name="Bank 04 D - A-1 (021)", input="value", min=0, max=127},
        {name="Bank 04 E - A#-1 (022)", input="value", min=0, max=127},
        {name="Bank 04 F - B-1 (023)", input="value", min=0, max=127},
        {name="Bank 05 A - C0 (024)", input="value", min=0, max=127},
        {name="Bank 05 B - C#0 (025)", input="value", min=0, max=127},
        {name="Bank 05 C - D0 (026)", input="value", min=0, max=127},
        {name="Bank 05 D - D#0 (027)", input="value", min=0, max=127},
        {name="Bank 05 E - E0 (028)", input="value", min=0, max=127},
        {name="Bank 05 F - F0 (029)", input="value", min=0, max=127},
        {name="Bank 06 A - F#0 (030)", input="value", min=0, max=127},
        {name="Bank 06 B - G0 (031)", input="value", min=0, max=127},
        {name="Bank 06 C - G#0 (032)", input="value", min=0, max=127},
        {name="Bank 06 D - A0 (033)", input="value", min=0, max=127},
        {name="Bank 06 E - A#0 (034)", input="value", min=0, max=127},
        {name="Bank 06 F - B0 (035)", input="value", min=0, max=127},
        {name="Bank 07 A - C1 (036)", input="value", min=0, max=127},
        {name="Bank 07 B - C#1 (037)", input="value", min=0, max=127},
        {name="Bank 07 C - D1 (038)", input="value", min=0, max=127},
        {name="Bank 07 D - D#1 (039)", input="value", min=0, max=127},
        {name="Bank 07 E - E1 (040)", input="value", min=0, max=127},
        {name="Bank 07 F - F1 (041)", input="value", min=0, max=127},
        {name="Bank 08 A - F#1 (042)", input="value", min=0, max=127},
        {name="Bank 08 B - G1 (043)", input="value", min=0, max=127},
        {name="Bank 08 C - G#1 (044)", input="value", min=0, max=127},
        {name="Bank 08 D - A1 (045)", input="value", min=0, max=127},
        {name="Bank 08 E - A#1 (046)", input="value", min=0, max=127},
        {name="Bank 08 F - B1 (047)", input="value", min=0, max=127},
        {name="Bank 09 A - C2 (048)", input="value", min=0, max=127},
        {name="Bank 09 B - C#2 (049)", input="value", min=0, max=127},
        {name="Bank 09 C - D2 (050)", input="value", min=0, max=127},
        {name="Bank 09 D - D#2 (051)", input="value", min=0, max=127},
        {name="Bank 09 E - E2 (052)", input="value", min=0, max=127},
        {name="Bank 09 F - F2 (053)", input="value", min=0, max=127},
        {name="Bank 10 A - F#2 (054)", input="value", min=0, max=127},
        {name="Bank 10 B - G2 (055)", input="value", min=0, max=127},
        {name="Bank 10 C - G#2 (056)", input="value", min=0, max=127},
        {name="Bank 10 D - A2 (057)", input="value", min=0, max=127},
        {name="Bank 10 E - A#2 (058)", input="value", min=0, max=127},
        {name="Bank 10 F - B2 (059)", input="value", min=0, max=127},
        {name="Bank 11 A - C3 (060)", input="value", min=0, max=127},
        {name="Bank 11 B - C#3 (061)", input="value", min=0, max=127},
        {name="Bank 11 C - D3 (062)", input="value", min=0, max=127},
        {name="Bank 11 D - D#3 (063)", input="value", min=0, max=127},
        {name="Bank 11 E - E3 (064)", input="value", min=0, max=127},
        {name="Bank 11 F - F3 (065)", input="value", min=0, max=127},
        {name="Bank 12 A - F#3 (066)", input="value", min=0, max=127},
        {name="Bank 12 B - G3 (067)", input="value", min=0, max=127},
        {name="Bank 12 C - G#3 (068)", input="value", min=0, max=127},
        {name="Bank 12 D - A3 (069)", input="value", min=0, max=127},
        {name="Bank 12 E - A#3 (070)", input="value", min=0, max=127},
        {name="Bank 12 F - B3 (071)", input="value", min=0, max=127},
        {name="Bank 13 A - C4 (072)", input="value", min=0, max=127},
        {name="Bank 13 B - C#4 (073)", input="value", min=0, max=127},
        {name="Bank 13 C - D4 (074)", input="value", min=0, max=127},
        {name="Bank 13 D - D#4 (075)", input="value", min=0, max=127},
        {name="Bank 13 E - E4 (076)", input="value", min=0, max=127},
        {name="Bank 13 F - F4 (077)", input="value", min=0, max=127},
        {name="Bank 14 A - F#4 (078)", input="value", min=0, max=127},
        {name="Bank 14 B - G4 (079)", input="value", min=0, max=127},
        {name="Bank 14 C - G#4 (080)", input="value", min=0, max=127},
        {name="Bank 14 D - A4 (081)", input="value", min=0, max=127},
        {name="Bank 14 E - A#4 (082)", input="value", min=0, max=127},
        {name="Bank 14 F - B4 (083)", input="value", min=0, max=127},
        {name="Bank 15 A - C5 (084)", input="value", min=0, max=127},
        {name="Bank 15 B - C#5 (085)", input="value", min=0, max=127},
        {name="Bank 15 C - D5 (086)", input="value", min=0, max=127},
        {name="Bank 15 D - D#5 (087)", input="value", min=0, max=127},
        {name="Bank 15 E - E5 (088)", input="value", min=0, max=127},
        {name="Bank 15 F - F5 (089)", input="value", min=0, max=127},
        {name="Bank 16 A - F#5 (090)", input="value", min=0, max=127},
        {name="Bank 16 B - G5 (091)", input="value", min=0, max=127},
        {name="Bank 16 C - G#5 (092)", input="value", min=0, max=127},
        {name="Bank 16 D - A5 (093)", input="value", min=0, max=127},
        {name="Bank 16 E - A#5 (094)", input="value", min=0, max=127},
        {name="Bank 16 F - B5 (095)", input="value", min=0, max=127},
        {name="Bank 17 A - C6 (096)", input="value", min=0, max=127},
        {name="Bank 17 B - C#6 (097)", input="value", min=0, max=127},
        {name="Bank 17 C - D6 (098)", input="value", min=0, max=127},
        {name="Bank 17 D - D#6 (099)", input="value", min=0, max=127},
        {name="Bank 17 E - E6 (100)", input="value", min=0, max=127},
        {name="Bank 17 F - F6 (101)", input="value", min=0, max=127},
        {name="Bank 18 A - F#6 (102)", input="value", min=0, max=127},
        {name="Bank 18 B - G6 (103)", input="value", min=0, max=127},
        {name="Bank 18 C - G#6 (104)", input="value", min=0, max=127},
        {name="Bank 18 D - A6 (105)", input="value", min=0, max=127},
        {name="Bank 18 E - A#6 (106)", input="value", min=0, max=127},
        {name="Bank 18 F - B6 (107)", input="value", min=0, max=127},
        {name="Bank 19 A - C7 (108)", input="value", min=0, max=127},
        {name="Bank 19 B - C#7 (109)", input="value", min=0, max=127},
        {name="Bank 19 C - D7 (110)", input="value", min=0, max=127},
        {name="Bank 19 D - D#7 (111)", input="value", min=0, max=127},
        {name="Bank 19 E - E7 (112)", input="value", min=0, max=127},
        {name="Bank 19 F - F7 (113)", input="value", min=0, max=127},
        {name="Bank 20 A - F#7 (114)", input="value", min=0, max=127},
        {name="Bank 20 B - G7 (115)", input="value", min=0, max=127},
        {name="Bank 20 C - G#7 (116)", input="value", min=0, max=127},
        {name="Bank 20 D - A7 (117)", input="value", min=0, max=127},
        {name="Bank 20 E - A#7 (118)", input="value", min=0, max=127},
        {name="Bank 20 F - B7 (119)", input="value", min=0, max=127},
        {name="MIDI 120 - C8", input="value", min=0, max=127},
        {name="MIDI 121 - C#8", input="value", min=0, max=127},
        {name="MIDI 122 - D8", input="value", min=0, max=127},
        {name="MIDI 123 - D#8", input="value", min=0, max=127},
        {name="MIDI 124 - E8", input="value", min=0, max=127},
        {name="MIDI 125 - F8", input="value", min=0, max=127},
        {name="MIDI 126 - F#8", input="value", min=0, max=127},
        {name="STOP - G8 (127)", input="value", min=0, max=127},
    }

    remote.define_items(items)
end

local function handle_note(event, note, value)
    remote.handle_input({
        time_stamp = event.time_stamp,
        item = note + 1,
        value = value
    })
end

function remote_process_midi(event)
    -- Note On on any MIDI channel.
    local note_on = remote.match_midi("9? xx yy", event)
    if note_on ~= nil then
        if note_on.y == 0 then
            handle_note(event, note_on.x, 0)
        else
            handle_note(event, note_on.x, 127)
        end
        return true
    end

    -- Note Off on any MIDI channel.
    local note_off = remote.match_midi("8? xx yy", event)
    if note_off ~= nil then
        handle_note(event, note_off.x, 0)
        return true
    end

    return false
end
