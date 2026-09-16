# Looptimus Remote for Reason

An unofficial Reason Remote codec for the **Loop Community Looptimus** foot controller.

It fixes a problem where a Looptimus switch assigned through **Reason Remote Override** can require **two physical presses** for a control that should trigger with one press.

## Why this exists

I bought the Looptimus specifically to control Reason hands-free, but some Remote Override assignments behaved like this:

- first stomp: the mapped control switched on / highlighted
- second stomp: the control switched off and the function finally executed

I ended up building a fairly elaborate Thor/CV workaround just to turn a Looptimus stomp into a usable trigger.

This codec fixes the problem at the Reason Remote layer instead.

I am publishing it because I do not want somebody else with the same Looptimus/Reason problem to lose the same amount of time on workarounds.

## The fix

The Looptimus sends a short MIDI note for a footswitch press:

```text
Note On
Note Off
```

The important discovery was that exposing those switches to Reason Remote as `button` controls did **not** solve the problem. In this use case, Reason could effectively treat the control like a toggle and the release state was not producing the required behavior.

The working solution is to expose each Looptimus switch as a Remote **value** control:

```text
Note On  -> 127
Note Off -> 0
```

That makes one physical Looptimus stomp produce the complete high-to-low transition required by controls such as the Warp Looper track switches.

## Installation

1. Close Reason completely.
2. Download or clone this repository.
3. Run `Install Looptimus Momentary.bat`.
4. Start Reason.
5. Open **Settings / Preferences -> MIDI**.
6. Choose **Add manually**.
7. Select:
   - Manufacturer: `Loop Community`
   - Model: `Looptimus Momentary`
   - MIDI In: your Looptimus MIDI port
8. MIDI Out is optional and can be left unselected.
9. Create a fresh **Remote Override** for the Reason or Rack Extension control you want to operate.
10. Press the desired Looptimus footswitch to learn it.

The Remote controls are labelled with bank, Looptimus switch and MIDI note information, for example:

```text
Bank 01 A - C-2 (000)
Bank 01 B - C#-2 (001)
...
Bank 20 F - B7 (119)
STOP - G8 (127)
```

The bank/button labels assume the standard sequential Looptimus note layout. If you use custom Looptimus note assignments, the MIDI note portion remains useful but the bank/button label may not match your setup.

## Uninstall

1. Close Reason.
2. Run `Uninstall Looptimus Momentary.bat`.
3. Restart Reason.

The uninstaller removes only the files installed by this codec.

## Tested with

The codec was developed and tested with:

- Loop Community Looptimus
- Reason 14
- Remote Override mappings
- Warp Looper Rack Extension

It may also help with other Reason devices or Rack Extensions where short Looptimus MIDI notes behave incorrectly through Remote Override.

If you find a bug, please report exactly what Reason version, Looptimus configuration and mapped control you are using.

## Disclaimer

This is an **unofficial community project**.

It is not affiliated with, endorsed by, or supported by **Loop Community**, **Reason Studios**, or the developer of **Warp Looper**.

Use it at your own risk. Keep a backup of your Reason Remote configuration if that matters to your setup.

## Development note

This codec and its documentation were developed with substantial assistance from **OpenAI's ChatGPT**. The repository owner described the Looptimus/Reason problem, tested multiple iterations on the actual hardware and in Reason, reported the observed behavior, and verified the final working solution.

AI is not part of the codec itself and is not used when it runs. This note is included simply to be transparent about how the project was created.

## License

MIT. See [LICENSE](LICENSE).
