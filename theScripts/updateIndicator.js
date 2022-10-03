.import "staticValues.js" as SVS

function setIndexTitleBarFromSwipeView(indexValue)
{
    switch(indexValue)
    {
        case 0: appTitle = SVS.listTitles[0]; break;
        case 1: appTitle = SVS.listTitles[1]; break;
        case 2: appTitle = SVS.listTitles[2]; break;
        case 3: appTitle = SVS.listTitles[3]; break;
        case 4: appTitle = SVS.listTitles[4]; break;
        case 5: appTitle = SVS.listTitles[5]; break;
        case 6: appTitle = SVS.listTitles[6]; break;
        case 7: appTitle = SVS.listTitles[7]; break;
        default: console.log("(updateIndicator.js) failed to undrestand index title"); break;
    }
}
