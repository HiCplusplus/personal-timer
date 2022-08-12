function playSoundEffect(soundDevice,status,model)
//soundDevice -> SoundEffect id's
//status 0-> finished/ended/stopped , status 1-> started/run
//model -> 1-> sportTimer,  2-> Round/SET , 3-> Break/Rest
{
    switch(model)
    {
        case 1:
        {
            if(status)
            {
                console.log("[SoundSystem]: sportTimer has been started.");
                soundDevice.source = pathToActivedSoundPack+fileAudio_timerStarted;
            }
            else
            {
                console.log("[SoundSystem]: sportTimer has been finished.");
                soundDevice.source = pathToActivedSoundPack+fileAudio_timerStopped;
            }
        }break;


        case 2:
        {
            if(status)
            {
                console.log("[SoundSystem]: "+  Math.abs(tempRounds-(setRounds+1)) +" round started.");
                soundDevice.source = pathToActivedSoundPack+fileAudio_roundStarted;
            }
            else
            {
                console.log("[SoundSystem]: "+  Math.abs(tempRounds-(setRounds+1)) +" round finished.");
                soundDevice.source = pathToActivedSoundPack+fileAudio_roundStopped;
            }
        }break;



        case 3:
        {
            if(status)
            {
                console.log("[SoundSystem]: "+  Math.abs(tempBreaks-(setRounds+1)) +" break started.");
                soundDevice.source = pathToActivedSoundPack+fileAudio_breakStarted;
            }
            else
            {
                console.log("[SoundSystem]: "+ Math.abs(tempBreaks-(setRounds+1)) +" break finished.");
                soundDevice.source = pathToActivedSoundPack+fileAudio_breakStopped;
            }
        }break;

        default:
            console.log("[SoundSystem] ERROR WHILE FIND SoundEffect Model from theScripts->theTimer->sportTimerSoundEffects.js");
            break;
    }


    soundDevice.play();


}
