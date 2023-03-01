<!DOCTYPE html>
<html lang="en">
    
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" media="screen" href="../jqGrid/css/jquery-ui.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="../jqGrid/css/trirand/ui.jqgrid.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="../libraries/themes/redmond/jquery-ui.theme.css"/>
        <link rel="stylesheet" type="text/css" media="screen" href="../libraries/themes/redmond/jquery-ui.css"/>
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="../jqGrid/js/trirand/i18n/grid.locale-en.js" type="text/javascript"></script>
        <script src="../jqGrid/js/trirand/jquery.jqGrid.min.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/jquery.inputmask.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/autonumeric@4.5.4"></script>
        <script src="https://unpkg.com/autonumeric"></script>
        <script src="../jqGrid/jqgridjs/highlight/highlight.js" type="text/javascript"></script>
        
        <style type="text/css">
		* 
            .highlight {
                background-color: #fbec88;
            }
        * {
			font-size: 12px;
		}

	    </style>

        <title>Penjualan</title>
    </head>
    <body>
        <div class="container">
            <form action="" method="post">
                <table id="grid_id"></table>
                <div id="jqGridPager"></div>
                <div id="report_penjualan"></div>
                <div id="export_penjualan"></div>
            </form>  
        </div>
        <script> 
            let activeGrid = '#grid_id'
            let triggerClick = true
            let indexRow = 0
            let timeout = null
            let highlightSearch
            let sortName = 'Invoice'
        
            $(document).ready(function () 
            {   
                $("#grid_id").jqGrid(
                {
                    caption: 'Penjualan',
                    datatype: 'json',
                    url: '../api.php',
                    styleUI: 'jQueryUI',
                    width: 850,
                    height: 'auto',
                    pageable: true,
                    viewrecords: true,
                    ignoreCase: true,
                    sortname: sortName,
                    rowNum: 10,
                    toolbar: [true, "top"],
                    rownumbers: true,
                    autoencode: true,
                    sortable: true,
                    pager : '#jqGridPager',
                    editurl: 'save.php',
                    colNames: ['ID', 'No. Invoice', 'Nama Customer', 'Tanggal Pembelian', 'Jenis Kelamin', 'Saldo'],
                    colModel: 
                    [
                        {
                            name: 'Id',
                            sortable: true,
                            hidden: true,
                            key: true,
                            editable: true
                        },
                        {
                            name: 'Invoice',
                            index: 'Invoice',
                            sortable: true,
                            editable: true,
                            editoptions:
                            {
                                dataInit: function(element) 
                                {
                                    $(element).attr('autocomplete', 'off'),
                                    $(element).css('text-transform', 'uppercase')
                                }
                            },
                            searchoptions: 
                            {
                                dataInit: function(element) 
                                {
                                    $(element).attr('autocomplete', 'off')
                                },
                                sopt: ["in","ge","le"] 
						    }
                        },
                        {
                            name: 'Nama',
                            index: 'Nama',
                            sortable: true,
                            editable: true,
                            editoptions:
                            {
                                dataInit: function(element) 
                                {
                                    $(element).attr('autocomplete', 'off'),
                                    $(element).css('text-transform', 'uppercase')
                                }
                            },
                            searchoptions: 
                            {
                                dataInit: function(element) 
                                {
                                    $(element).attr('autocomplete', 'off')
                                }
						    }
                        },
                        {
                            name: 'Tgl',
                            index: 'Tgl',
                            sortable: true,
                            editable: true,
                            editoptions:
                            {
                                dataInit: function(element) 
                                {
                                    $(element).attr('autocomplete', 'off'),
                                    $(element).css('text-transform', 'uppercase'),
                                    $(element).datepicker(
                                        {
                                            dateFormat: 'dd-mm-yy'
                                        }
                                    ),
                                    $(element).inputmask("date",
                                        {
                                            mask: "1-2-y",
                                            separator: "-",
                                            alias: "d-m-y"
                                        }
                                    )
                                }
                            },
                            formatter: 'date',
                            formatoptions: 
                            { 
                                newformat: 'd-m-Y'
                            },
                            sorttype:'date',
                            searchoptions: 
                            {
                                dataInit: function(element)
                                {
                                    $(element).attr('autocomplete', 'off')
                                }
						    }
                        },
                        {
                            name: 'Jeniskelamin',
                            index: 'Jeniskelamin',
                            sortable: true,
                            editable: true,
                            edittype: 'select',
                            editoptions:
                            {
                                value: 'Laki-Laki:LAKI-LAKI;Perempuan:PEREMPUAN',
                                dataInit: function(element) 
                                {
                                    $(element).select2(),
                                    $(element).css('text-transform', 'uppercase')
                                }
                            },
                            searchoptions: 
                            {
                                dataInit: function(element)
                                {
                                    $(element).attr('autocomplete', 'off')
                                }
						    }
                        },
                        {
                            name: 'Saldo',
                            index: 'Saldo',
                            sortable: true,
                            align: 'right',
                            editable: true,
                            editoptions:
                            {
                                dataInit: function(element) 
                                {
                                    element.style.textAlign = 'right',
                                    $(element).attr('autocomplete', 'off'),
                                    new AutoNumeric(element,
                                    {
                                        currencySymbol : ' ',
                                        decimalCharacter : ',',
                                        digitGroupSeparator : '.'
                                    })
                                }
                            },
                            formatter:'currency',
                            formatoptions:
                            {
                                thousandsSeparator: ".",
                                decimalSeparator: ",",
                                decimalPlaces : 2,
                                prefix : 'Rp ',  
                                deaultValue: "Rp 0.00",
                            },
                            searchoptions: 
                            {
                                dataInit: function(element)
                                {
                                    $(element).attr('autocomplete', 'off')
                                }
						    }
                        }
                    ],
                    jsonReader: 
                    {
                        root: 'data',
                        id: 'Id',
                        repeatitems: false
                    },
                    onSelectRow: function(id) 
                    {
                        indexRow = $(this).jqGrid('getCell', id, 'rn') - 1

                        page = $(this).jqGrid('getGridParam', 'page') - 1
    	                rows = $(this).jqGrid('getGridParam', 'postData').rows
                        if (indexRow >= rows) indexRow = (indexRow - rows * page)
                    },
                    loadComplete: function() 
                    {
                        $(document).unbind('keydown')
			            setCustomBindKeys($(this))
                        postData = $(this).jqGrid('getGridParam', 'postData')

                        setTimeout(function()
                        {
                            $('#grid_id tbody tr td:not([aria-describedby=grid_id_rn])').highlight(highlightSearch)

                            if (indexRow > $('#grid_id').getDataIDs().length - 1) { 
                                indexRow = $('#grid_id').getDataIDs().length - 1
                            }

                            if (triggerClick) {
                                $('#' + $('#grid_id').getDataIDs()[indexRow]).click()
                                triggerClick = false
                            } else {
                                $('#grid_id').setSelection($('#grid_id').getDataIDs()[indexRow])
                            }

                            $('#gsh_grid_id_rn').html(`
                                <button type="button" id="clearFilter" title="Clear Filter" style="width: 100%; height: 100%;"> X </button>
                            `).click(function(){})

                            $('[id*=gs_]').on('input', function() 
                            {
                                highlightSearch = $(this).val()
                            })

                            $('#t_grid_id input').on('input', function() 
                            {
                                clearTimeout(timeout)
                                timeout = setTimeout(function()
                                {
                                    $('#grid_id').jqGrid('setGridParam', 
                                    {
                                        postData : {'global_search': highlightSearch}
                                    })
                                    .trigger('reloadGrid')
                                }, 400)
                            })

                            $('input')
                            .css('text-transform', 'uppercase')
                            .attr('autocomplete', 'off')
                        }) 
                    }
                });
                var source =
                {
                    beforeprocessing: function(data)
                    {		
                        source.totalrecords = data[0].TotalRows;
                    }
                };
                jQuery("#grid_id").jqGrid('filterToolbar', 
                {
                    autosearch: true,
                    searchOnEnter: false,
                    stringResult: true,
                    ignoreCase: true,
                    defaultSearch: 'cn', 
                    groupOp: 'AND',
                }),
                jQuery("#grid_id").jqGrid('navGrid', '#jqGridPager', null,
                {
                    recreateForm: true,
                    beforeShowForm: function(form) 
                    { 
                      $('#Invoice').attr('readonly','readonly');

                      let invoiceValue = form.find('#Invoice').val();
                      let namaValue = form.find('#Nama').val();
                      let tglValue = form.find('#Tgl').val();
                      let jeniskelaminValue = form.find('#Jeniskelamin').val();
                      let saldoValue = form.find('#Saldo').val();
                      
                      console.log(form.find('#Invoice').val(invoiceValue.replace('<span class="highlight">', '').replace('</span>', '')));
                      console.log(form.find('#Nama').val(namaValue.replace('<span class="highlight">', '').replace('</span>', '')));
                      console.log(form.find('#Tgl').val(tglValue.replace('<span class="highlight">', '').replace('</span>', '')));
                      console.log(form.find('#Jeniskelamin').val(jeniskelaminValue.replace('<span class="highlight">', '').replace('</span>', '')));
                      console.log(form.find('#Saldo').val(saldoValue.replace('<span class="highlight">', '').replace('</span>', '')));
                    },
                    afterSubmit:callAfterSubmit,
                    reloadAfterSubmit:true,

                    serializeRowData: function(postData)
                    { 
                        postData.Invoice = postData.Invoice.toUpperCase();
                        postData.Nama = postData.Nama.toUpperCase();
                        postData.Tgl = postData.Tgl.toUpperCase();
                        postData.Jeniskelamin = postData.Jeniskelamin.toUpperCase();
                        postData.Saldo = postData.Saldo.toUpperCase();
                        return postData;
                    }
                }, {
                    recreateForm: true,
                    afterSubmit:callAfterSubmit,
                    reloadAfterSubmit:true 
                }),

                $(document).on('click','#clearFilter',function()
                {
                    currentSearch = undefined
                    $('[id*="gs_"]').val('')
                    $('#grid_id').jqGrid('setGridParam', {postData: null})
                    $('#grid_id').jqGrid('setGridParam',
                    {
                        postData: 
                        {
                            page: 1,
                            rows: 10,
                            sidx: 'Invoice',
                            sord: 'asc',
                        },
                    })
                    .trigger('reloadGrid')
                    highlightSearch = 'undefined'
                }),

                $("#t_grid_id").html(`
                    <div id="global_search">
                        <label> Global search </label>
                        <input id="gs_global_search" class="ui-widget-content ui-corner-all" style="padding: 5px;" globalsearch="true" clearsearch="true">
                    </div>
                `)

                $('#grid_id').navButtonAdd('#jqGridPager', 
                {
                    caption: "",
                    title: "Report",
                    id: "penjualanReport",
                    buttonicon: "ui-icon-document",
                    onClickButton:function()
                    {
                        $('#report_penjualan')
                            .html(`
                                <div class="ui-state-default" style="padding: 5px;">
                                    <h5> Tentukan Baris </h5>
                                    
                                    <label> Dari : </label>
                                    <input type="text" name="start" value="${$(this).getInd($(this).getGridParam('selrow'))}" class="ui-widget-content ui-corner-all autonumeric" style="padding: 5px; text-transform: uppercase;" max="2" required>

                                    <label> Sampai : </label>
                                    <input type="text" name="limit" value="${$(this).getGridParam('records')}" class="ui-widget-content ui-corner-all autonumeric" style="padding: 5px; text-transform: uppercase;" max="2" required>
                                </div>
                            `)
                            .dialog({
                                title: "Penjualan",
                                height: 'auto',
                                width: '400', 
                                position: [0, 0],
                                buttons: {
                                    'Report': function() 
                                    {
                                        let start = $(this).find('input[name=start]').val()
                                        let limit = $(this).find('input[name=limit]').val()
                                        let params

                                        if (parseInt(start) > parseInt(limit)) {
                                            return alert('Sampai harus lebih besar')
                                        }

                                        for (var key in postData) {
                                        if (params != "") {
                                            params += "&";
                                        }
                                        params += key + "=" + encodeURIComponent(postData[key]);
                                        }

                                        window.open(`reportController.php?${params}&start=${start}&limit=${limit}&sidx=${postData.sidx}&sord=${postData.sord}`)
                                    },
                                    'Cancel': function() 
                                    {
                                        activeGrid = '#grid_id'
                                        $(this).dialog('close')
                                    }
                                }
                            })
                    },
                })

                $('#grid_id').navButtonAdd('#jqGridPager', 
                {
                    caption: "",
                    title: "Export",
                    id: "penjualanExport",
                    buttonicon: "ui-icon-document",
                    onClickButton:function()
                    {
                        $('#export_penjualan')
                            .html(`
                                <div class="ui-state-default" style="padding: 5px;">
                                    <h5> Tentukan Baris </h5>
                                    
                                    <label> Dari : </label>
                                    <input type="text" name="start" value="${$(this).getInd($(this).getGridParam('selrow'))}" class="ui-widget-content ui-corner-all autonumeric" style="padding: 5px; text-transform: uppercase;" max="2" required>

                                    <label> Sampai : </label>
                                    <input type="text" name="limit" value="${$(this).getGridParam('records')}" class="ui-widget-content ui-corner-all autonumeric" style="padding: 5px; text-transform: uppercase;" max="2" required>
                                </div>
                            `)
                            .dialog({
                                title: "Penjualan",
                                height: 'auto',
                                width: '400', 
                                position: [0, 0],
                                buttons: {
                                    'Export': function() 
                                    {
                                        let start = $(this).find('input[name=start]').val()
                                        let limit = $(this).find('input[name=limit]').val()
                                        let params
                                        
                                        if (parseInt(start) > parseInt(limit)) {
                                            return alert('Sampai harus lebih besar')
                                        }

                                        for (var key in postData) {
                                        if (params != "") {
                                            params += "&";
                                        }
                                        params += key + "=" + encodeURIComponent(postData[key]);
                                        }

                                        window.open(`exportController.php?${params}&start=${start}&limit=${limit}`)
                                    },
                                    'Cancel': function() 
                                    {
                                        activeGrid = '#grid_id'
                                        $(this).dialog('close')
                                    }
                                }
                            })
                    },
                })
            });

            function callAfterSubmit(response, postData, oper)
            {
                filters = $(this).jqGrid('getGridParam').postData.filters;
                filterrules = JSON.parse($(this).jqGrid('getGridParam').postData.filters).rules;

                // if(filters)
                // {
                //     totalfilters = filterrules.length;
                //     let i;
                //     for(i=0; i<totalfilters; i++)
                //     {
                //         filterfield = JSON.parse($(this).jqGrid('getGridParam').postData.filters).rules[i]['field'];
                //         filterdata = JSON.parse($(this).jqGrid('getGridParam').postData.filters).rules[i]['data'];
                //     }
                // }
                
                sortfield = $(this).jqGrid('getGridParam', 'postData').sidx;
                sortorder = $(this).jqGrid('getGridParam', 'postData').sord;
                pagesize = $(this).jqGrid('getGridParam', 'postData').rows;
                
                $.ajax(
                {
                    url:"aftersave.php",
                    dataType: 'JSON',  
                    data: 
                    {                        
                        Invoice: JSON.parse(response.responseText).Invoice,
                        sidx: sortfield,
                        sord: sortorder,
                        filter: filters,
                        filterules: filterrules
                    }
                })
                .done(function(data)
                {
                    $('#cData').click();
                    let posisi = data.position;
                    let pager = Math.ceil(posisi / pagesize);
                    let rows = posisi - (pager - 1)* pagesize;
                    indexRow = rows-1;
                    $('#grid_id').trigger('reloadGrid', {page:pager});
                } )
            }

            function setCustomBindKeys(grid) {
                $(document).on("keydown", function (e) {
                    if (activeGrid) {
                        if (
                            e.keyCode == 33 ||
                            e.keyCode == 34 ||
                            e.keyCode == 35 ||
                            e.keyCode == 36 ||
                            e.keyCode == 38 ||
                            e.keyCode == 40 ||
                            e.keyCode == 13
                        ) {
                            e.preventDefault();

                            var gridIds = $(activeGrid).getDataIDs();
                            var selectedRow = $(activeGrid).getGridParam("selrow");
                            var currentPage = $(activeGrid).getGridParam("page");
                            var lastPage = $(activeGrid).getGridParam("lastpage");
                            var currentIndex = 0;
                            var row = $(activeGrid).jqGrid("getGridParam", "postData").rows;

                            for (var i = 0; i < gridIds.length; i++) {
                                if (gridIds[i] == selectedRow) currentIndex = i;
                            }

                            if (triggerClick == false) {
                                if (33 === e.keyCode) {
                                    if (currentPage > 1) {
                                        $(activeGrid)
                                            .jqGrid("setGridParam", {
                                                page: parseInt(currentPage) - 1,
                                            })
                                            .trigger("reloadGrid");

                                        triggerClick = true;
                                    }
                                    $(activeGrid).triggerHandler("jqGridKeyUp"), e.preventDefault();
                                }
                                if (34 === e.keyCode) {
                                    if (currentPage !== lastPage) {
                                        $(activeGrid)
                                            .jqGrid("setGridParam", {
                                                page: parseInt(currentPage) + 1,
                                            })
                                            .trigger("reloadGrid");

                                        triggerClick = true;
                                    }
                                    $(activeGrid).triggerHandler("jqGridKeyUp"), e.preventDefault();
                                }
                                if (35 === e.keyCode) {
                                    if (currentPage !== lastPage) {
                                        $(activeGrid)
                                            .jqGrid("setGridParam", {
                                                page: lastPage,
                                            })
                                            .trigger("reloadGrid");
                                        if (e.ctrlKey) {
                                            if (
                                                $(activeGrid).jqGrid("getGridParam", "selrow") !==
                                                $("#customer")
                                                    .find(">tbody>tr.jqgrow")
                                                    .filter(":last")
                                                    .attr("id")
                                            ) {
                                                $(activeGrid)
                                                    .jqGrid(
                                                        "setSelection",
                                                        $(activeGrid)
                                                            .find(">tbody>tr.jqgrow")
                                                            .filter(":last")
                                                            .attr("id")
                                                    )
                                                    .trigger("reloadGrid");
                                            }
                                        }

                                        triggerClick = true;
                                    }
                                    if (e.ctrlKey) {
                                        if (
                                            $(activeGrid).jqGrid("getGridParam", "selrow") !==
                                            $("#customer")
                                                .find(">tbody>tr.jqgrow")
                                                .filter(":last")
                                                .attr("id")
                                        ) {
                                            $(activeGrid)
                                                .jqGrid(
                                                    "setSelection",
                                                    $(activeGrid)
                                                        .find(">tbody>tr.jqgrow")
                                                        .filter(":last")
                                                        .attr("id")
                                                )
                                                .trigger("reloadGrid");
                                        }
                                    }
                                    $(activeGrid).triggerHandler("jqGridKeyUp"), e.preventDefault();
                                }
                                if (36 === e.keyCode) {
                                    if (currentPage > 1) {
                                        if (e.ctrlKey) {
                                            if (
                                                $(activeGrid).jqGrid("getGridParam", "selrow") !==
                                                $("#customer")
                                                    .find(">tbody>tr.jqgrow")
                                                    .filter(":first")
                                                    .attr("id")
                                            ) {
                                                $(activeGrid).jqGrid(
                                                    "setSelection",
                                                    $(activeGrid)
                                                        .find(">tbody>tr.jqgrow")
                                                        .filter(":first")
                                                        .attr("id")
                                                );
                                            }
                                        }
                                        $(activeGrid)
                                            .jqGrid("setGridParam", {
                                                page: 1,
                                            })
                                            .trigger("reloadGrid");

                                        triggerClick = true;
                                    }
                                    $(activeGrid).triggerHandler("jqGridKeyUp"), e.preventDefault();
                                }
                                if (38 === e.keyCode) {
                                    if (currentIndex - 1 >= 0) {
                                        $(activeGrid)
                                            .resetSelection()
                                            .setSelection(gridIds[currentIndex - 1]);
                                    }
                                }
                                if (40 === e.keyCode) {
                                    if (currentIndex + 1 < gridIds.length) {
                                        $(activeGrid)
                                            .resetSelection()
                                            .setSelection(gridIds[currentIndex + 1]);
                                    }
                                }
                                if (13 === e.keyCode) {
                                    let rowId = $(activeGrid).getGridParam("selrow");
                                    let ondblClickRowHandler = $(activeGrid).jqGrid(
                                        "getGridParam",
                                        "ondblClickRow"
                                    );

                                    if (ondblClickRowHandler) {
                                        ondblClickRowHandler.call($(activeGrid)[0], rowId);
                                    }
                                }
                            }
                        }
                    }
                });
            }
        </script>
    </body>
</html>