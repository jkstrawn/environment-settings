; #####################################################################
; #
; # QMK Layout Emulator for Standard Keyboard (Dvorak Input)
; #
; # - Simulates a custom QMK layout using AutoHotkey.
; # - This script is designed for a user with a DVORAK keyboard layout
; #   active in the OS, but pressing keys on a physical QWERTY keyboard.
; # - Left Alt (LAlt) activates the LOWER layer.
; # - Right Alt (RAlt) activates the RAISE layer.
; # - CapsLock is remapped to Escape.
; #
; #####################################################################

#Requires AutoHotkey v2.0
#SingleInstance force
SetCapsLockState "AlwaysOff" ; Ensure CapsLock doesn't toggle its state

; --- Global Hotkeys ---
CapsLock::Send("{Escape}")     ; Remap CapsLock to Escape

; --- LOWER LAYER (Activated by holding Left Alt) ---
; Corresponds to your [_LOWER] layout. Hotkeys are mapped from physical
; QWERTY key locations to the characters they produce in Dvorak.

; Top Row (Numbers) - Unchanged
LAlt & 1::Send("!")
LAlt & 2::Send("@")
LAlt & 3::Send("#")
LAlt & 4::Send("$")
LAlt & 5::Send("{%}")
LAlt & 6::Send("^")
LAlt & 7::Send("&")
LAlt & 8::Send("*")
LAlt & 9::Send("{Numpad7}")
LAlt & 0::Send("{Numpad8}")
LAlt & [::Send("{Numpad9}")     ; Corrected: Physical '-' key produces '[' in Dvorak.

; QWERTY Row (Shifted right, Dvorak mapping)
; LAlt & Tab was removed as requested
LAlt & '::Send("^z")           ; Physical Q -> Dvorak '
LAlt & ,::Send("^x")           ; Physical W -> Dvorak ,
LAlt & .::Send("^c")           ; Physical E -> Dvorak .
LAlt & p::Send("^v")           ; Physical R -> Dvorak P
LAlt & y::Send("^y")           ; Physical T -> Dvorak Y
LAlt & f::Send("^")            ; Physical Y -> Dvorak F
LAlt & g::Send("&")            ; Physical U -> Dvorak G
LAlt & c::Send("|")            ; Physical I -> Dvorak C
LAlt & r::Send("{Numpad4}")    ; Physical O -> Dvorak R
LAlt & l::Send("{Numpad5}")    ; Physical P -> Dvorak L
LAlt & /::Send("{Numpad6}")    ; Physical [ -> Dvorak /

; ASDF Row (Shifted right, Dvorak mapping)
LAlt & CapsLock::Send("{Del}") ; This combo still works despite CapsLock being Escape
LAlt & a::Send("{F1}")         ; Physical A -> Dvorak A
LAlt & o::Send("{F2}")         ; Physical S -> Dvorak O
LAlt & e::Send("{F3}")         ; Physical D -> Dvorak E
LAlt & u::Send("{F4}")         ; Physical F -> Dvorak U
LAlt & i::Send("{F5}")         ; Physical G -> Dvorak I
LAlt & d::Send("{F6}")         ; Physical H -> Dvorak D
LAlt & h::Send("(")            ; Physical J -> Dvorak H
LAlt & t::Send(")")            ; Physical K -> Dvorak T
LAlt & n::Send("{Numpad1}")    ; Physical L -> Dvorak N
LAlt & s::Send("{Numpad2}")    ; Physical ; -> Dvorak S
LAlt & -::Send("{Numpad3}")    ; Physical ' -> Dvorak -

; ZXCV Row (Shifted right, Dvorak mapping)
; LShift is unassigned
LAlt & `;::Send("{F7}")         ; Physical Z -> Dvorak ;
LAlt & q::Send("{F8}")         ; Physical X -> Dvorak Q
LAlt & j::Send("{F9}")         ; Physical C -> Dvorak J
LAlt & k::Send("{F10}")        ; Physical V -> Dvorak K
LAlt & x::Send("{F11}")        ; Physical B -> Dvorak X
LAlt & b::Send("{F12}")        ; Physical N -> Dvorak B
LAlt & m::Send("-")            ; Physical M -> Dvorak M
LAlt & w::Send("_")            ; Physical , -> Dvorak W
LAlt & v::Send("{Numpad0}")    ; Physical . -> Dvorak V
LAlt & z::Send(".")            ; Physical / -> Dvorak Z

; Bottom Row (Spacebar area)
LAlt & Space::Send("{Media_Play_Pause}")

; --- RAISE LAYER (Activated by holding Right Alt) ---
; Corresponds to your [_RAISE] layout.

; Top Row (Numbers) - Unchanged
RAlt & 1::Send("1")
RAlt & 2::Send("2")
RAlt & 3::Send("3")
RAlt & 4::Send("4")
RAlt & 5::Send("5")
RAlt & 6::Send("6")
RAlt & 7::Send("7")
RAlt & 8::Send("8")
RAlt & 9::Send("9")
RAlt & 0::Send("0")
RAlt & =::Send("{Del}")

; QWERTY Row (Shifted right, Dvorak mapping)
RAlt & Tab::Send("``") ; Escaped backtick
; Q and W unassigned
RAlt & .::Send("[")            ; Physical E -> Dvorak .
RAlt & p::Send("]")            ; Physical R -> Dvorak P
; T is unassigned
RAlt & f::Send("!")            ; Physical Y -> Dvorak F
RAlt & g::Send("=")            ; Physical U -> Dvorak G
RAlt & c:: { ; Physical I -> Dvorak C -> Up Arrow
    mods := ""
    if GetKeyState("Control", "P")
        mods .= "^"
    if GetKeyState("LAlt", "P")
        mods .= "!"
    Send(mods . "{Up}")
}
; O and P are unassigned
RAlt & /::Send("{Del}")        ; Physical [ -> Dvorak /

; ASDF Row (Shifted right, Dvorak mapping)
RAlt & CapsLock::Send("{Del}")
RAlt & a::Send("{+}")            ; Physical A -> Dvorak A, wrapped
RAlt & o::Send("-")            ; Physical S -> Dvorak O
RAlt & e::Send("{{}")            ; Physical D -> Dvorak E, wrapped and escaped
RAlt & u::Send("{}}")            ; Physical F -> Dvorak U, wrapped and escaped
RAlt & i::Send("/")            ; Physical G -> Dvorak I
RAlt & d::Send("/")            ; Physical H -> Dvorak D
RAlt & h:: { ; Physical J -> Dvorak H -> Left Arrow
    mods := ""
    if GetKeyState("Control", "P")
        mods .= "^"
    if GetKeyState("LAlt", "P")
        mods .= "!"
    Send(mods . "{Left}")
}
RAlt & t:: { ; Physical K -> Dvorak T -> Down Arrow
    mods := ""
    if GetKeyState("Control", "P")
        mods .= "^"
    if GetKeyState("LAlt", "P")
        mods .= "!"
    Send(mods . "{Down}")
}
RAlt & n:: { ; Physical L -> Dvorak N -> Right Arrow
    mods := ""
    if GetKeyState("Control", "P")
        mods .= "^"
    if GetKeyState("LAlt", "P")
        mods .= "!"
    Send(mods . "{Right}")
}
RAlt & s::Send("/")            ; Physical ; -> Dvorak S
RAlt & -::Send("\")            ; Physical ' -> Dvorak -

; ZXCV Row (Shifted right, Dvorak mapping)
; LShift is unassigned
RAlt & `;::Send("{%}")          ; Physical Z -> Dvorak ;
RAlt & q::Send("*")          ; Physical X -> Dvorak Q
RAlt & j::Send("{#}")          ; Physical C -> Dvorak J, wrapped
RAlt & k::Send("$")          ; Physical V -> Dvorak K
; B and N are unassigned
RAlt & m::Send("{PgUp}")       ; Physical M -> Dvorak M
RAlt & w::Send("{PgDn}")       ; Physical , -> Dvorak W
RAlt & v::Send("{Home}")       ; Physical . -> Dvorak V
RAlt & z::Send("{End}")        ; Physical / -> Dvorak Z
RAlt & RShift::Send("\")

; Media keys on the RAISE layer are the same as LOWER layer.
RAlt & Space::Send("{Media_Play_Pause}")

return
