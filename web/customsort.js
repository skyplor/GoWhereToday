var sortDollar = fdTableSort.sortNumeric;

function sortDollarPrepareData(tdNode, innerText) {
    // Get the innerText of the TR nodes
    var aa = innerText;
    var retVal;
    if(String(aa)=== "$")
        return 1;
    else if(String(aa) === "$$")
        return 2;
    else if(String(aa)=== "$$$")
        return 3;
    else if(String(aa)=== "$$$$")
        return 4;
    else if(String(aa)=== "$$$$$")
        return 5;   
}
