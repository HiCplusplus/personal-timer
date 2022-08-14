function sayStartStop(soundDevice,status)
//status -> 0 Stopped , 1 Started
{
    if(status)
    {
        soundDevice.source = pathToActivedSpeechPack+fileAudio_speech_start;
    }
    else
    {
//        soundDevice.source = pathToActivedSpeechPack+fileAudio_speech_stop;
        soundDevice.source = pathToActivedSpeechPack+fileAudio_speech_cheer;

    }
    soundDevice.play();
}


function sayRoundBreak(soundDevice,status)
//status -> 0 stopped , 1 started                          ## round STOP REMOVED BECAUSE OF SOME REASONS
{
    if(status)
    {
        soundDevice.source = pathToActivedSpeechPack+fileAudio_speech_set;
        soundDevice.play();
    }
    else
    {
        soundDevice.source = pathToActivedSpeechPack+fileAudio_speech_rest;
        soundDevice.play();
    }
}

function sayEntyNumber(soundDevice,roundNumber)
{
    switch(roundNumber)
    {
        case 20:case 21:case 22:case 23:case 24:case 25:case 26:case 27:case 28:case 29:
        {
            soundDevice.source = pathToActivedSpeechPack+directory_sportTimer_SoundSpeech_Numbers+fileAudio_speech_numbers[20];
            soundDevice.play();
        }break;

        case 30:case 31:case 32:case 33:case 34:case 35:case 36:case 37:case 38:case 39:
        {
            soundDevice.source = pathToActivedSpeechPack+directory_sportTimer_SoundSpeech_Numbers+fileAudio_speech_numbers[30];
            soundDevice.play();
        }break;

        case 40:case 41:case 42:case 43:case 44:case 45:case 46:case 47:case 48:case 49:
        {
            soundDevice.source = pathToActivedSpeechPack+directory_sportTimer_SoundSpeech_Numbers+fileAudio_speech_numbers[40];
            soundDevice.play();
        }break;


        case 50:case 51:case 52:case 53:case 54:case 55:case 56:case 57:case 58:case 59:
        {
            soundDevice.source = pathToActivedSpeechPack+directory_sportTimer_SoundSpeech_Numbers+fileAudio_speech_numbers[50];
            soundDevice.play();
        }break;


        case 60:case 61:case 62:case 63:case 64:case 65:case 66:case 67:case 68:case 69:
        {
            soundDevice.source = pathToActivedSpeechPack+directory_sportTimer_SoundSpeech_Numbers+fileAudio_speech_numbers[60];
            soundDevice.play();
        }break;

        case 70:case 71:case 72:case 73:case 74:case 75:case 76:case 77:case 78:case 79:
        {
            soundDevice.source = pathToActivedSpeechPack+directory_sportTimer_SoundSpeech_Numbers+fileAudio_speech_numbers[70];
            soundDevice.play();
        }break;

        case 80:case 81:case 82:case 83:case 84:case 85:case 86:case 87:case 88:case 89:
        {
            soundDevice.source = pathToActivedSpeechPack+directory_sportTimer_SoundSpeech_Numbers+fileAudio_speech_numbers[80];
            soundDevice.play();
        }break;

        case 90:case 91:case 92:case 93:case 94:case 95:case 96:case 97:case 98:case 99:
        {
            soundDevice.source = pathToActivedSpeechPack+directory_sportTimer_SoundSpeech_Numbers+fileAudio_speech_numbers[90];
            soundDevice.play();
        }break;

        case 100:
        {
            soundDevice.source = pathToActivedSpeechPack+directory_sportTimer_SoundSpeech_Numbers+fileAudio_speech_numbers[100];
            soundDevice.play();
        }break;
    }


}

function saySingleNumbers(soundDevice,roundNumber)
{
    switch(roundNumber)
    {
        case 1:
        {
            soundDevice.source = pathToActivedSpeechPack+directory_sportTimer_SoundSpeech_Numbers+fileAudio_speech_numbers[1];
            soundDevice.play();
        }break;
        case 2:
        {
            soundDevice.source = pathToActivedSpeechPack+directory_sportTimer_SoundSpeech_Numbers+fileAudio_speech_numbers[2];
            soundDevice.play();
        }break;
        case 3:
        {
            soundDevice.source = pathToActivedSpeechPack+directory_sportTimer_SoundSpeech_Numbers+fileAudio_speech_numbers[3];
            soundDevice.play();
        }break;
        case 4:
        {
            soundDevice.source = pathToActivedSpeechPack+directory_sportTimer_SoundSpeech_Numbers+fileAudio_speech_numbers[4];
            soundDevice.play();
        }break;
        case 5:
        {
            soundDevice.source = pathToActivedSpeechPack+directory_sportTimer_SoundSpeech_Numbers+fileAudio_speech_numbers[5];
            soundDevice.play();
        }break;
        case 6:
        {
            soundDevice.source = pathToActivedSpeechPack+directory_sportTimer_SoundSpeech_Numbers+fileAudio_speech_numbers[6];
            soundDevice.play();
        }break;
        case 7:
        {
            soundDevice.source = pathToActivedSpeechPack+directory_sportTimer_SoundSpeech_Numbers+fileAudio_speech_numbers[7];
            soundDevice.play();
        }break;
        case 8:
        {
            soundDevice.source = pathToActivedSpeechPack+directory_sportTimer_SoundSpeech_Numbers+fileAudio_speech_numbers[8];
            soundDevice.play();
        }break;
        case 9:
        {
            soundDevice.source = pathToActivedSpeechPack+directory_sportTimer_SoundSpeech_Numbers+fileAudio_speech_numbers[9];
            soundDevice.play();
        }break;
    }
}

function sayTeenNumbers(soundDevice,roundNumber)
{
    switch(roundNumber)
    {
        case 10:
        {
            soundDevice.source = pathToActivedSpeechPack+directory_sportTimer_SoundSpeech_Numbers+fileAudio_speech_numbers[10];
            soundDevice.play();
        }break;
        case 11:
        {
            soundDevice.source = pathToActivedSpeechPack+directory_sportTimer_SoundSpeech_Numbers+fileAudio_speech_numbers[11];
            soundDevice.play();
        }break;
        case 12:
        {
            soundDevice.source = pathToActivedSpeechPack+directory_sportTimer_SoundSpeech_Numbers+fileAudio_speech_numbers[12];
            soundDevice.play();
        }break;
        case 13:
        {
            soundDevice.source = pathToActivedSpeechPack+directory_sportTimer_SoundSpeech_Numbers+fileAudio_speech_numbers[13];
            soundDevice.play();
        }break;
        case 14:
        {
            soundDevice.source = pathToActivedSpeechPack+directory_sportTimer_SoundSpeech_Numbers+fileAudio_speech_numbers[14];
            soundDevice.play();
        }break;
        case 15:
        {
            soundDevice.source = pathToActivedSpeechPack+directory_sportTimer_SoundSpeech_Numbers+fileAudio_speech_numbers[15];
            soundDevice.play();
        }break;
        case 16:
        {
            soundDevice.source = pathToActivedSpeechPack+directory_sportTimer_SoundSpeech_Numbers+fileAudio_speech_numbers[16];
            soundDevice.play();
        }break;
        case 17:
        {
            soundDevice.source = pathToActivedSpeechPack+directory_sportTimer_SoundSpeech_Numbers+fileAudio_speech_numbers[17];
            soundDevice.play();
        }break;
        case 18:
        {
            soundDevice.source = pathToActivedSpeechPack+directory_sportTimer_SoundSpeech_Numbers+fileAudio_speech_numbers[18];
            soundDevice.play();
        }break;
        case 19:
        {
            soundDevice.source = pathToActivedSpeechPack+directory_sportTimer_SoundSpeech_Numbers+fileAudio_speech_numbers[19];
            soundDevice.play();
        }break;
    }

}


function sayDymanicThings(soundDevice,sayTimer,fileName)
{
    if(soundDevice.running==false)
    {
        soundDevice.source = pathToActivedSpeechPack + fileName;
        soundDevice.play();
    }
}
