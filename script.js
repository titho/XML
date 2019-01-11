function sortTable(col, reverse) {
    var typeOnSort = document.getElementById("typeOnSorting").value;
    var reverse = 1;

    if (typeOnSort == "descending")
        reverse = -1;
    else reverse = 1;

    var table = document.getElementById("wines")
    var tb = table.tBodies[0],
        tr = Array.prototype.slice.call(tb.rows, 0),
        i;
    reverse = -((+reverse) || -1);
    tr = tr.sort(function (a, b) {
        return reverse
            * (a.cells[col].textContent.trim()
                .localeCompare(b.cells[col].textContent.trim())
               );
    });
    for (i = 0; i < tr.length; ++i) tb.appendChild(tr[i]);
}

