{{extends file="adminLayout.tpl"}}
{{block name="header"}}
<title>{{$title}}</title>
{{/block}}

{{block name="content"}}
    <div class="outer">
        <div class="inner">
            {{*DataTables Grid Start Here*}}
            <div class="row ui-sortable">
                <div class="col-lg-12">
                    <div class="box">
                        <header>
                            <div class="icons">
                                <i class="fa fa-table"></i>
                            </div>
                            <h5>Manage Groups</h5>
                            <div style="float:right; margin-right:10px; margin-top: 5px;">
                                {{*Select2 DropDown to select the Group*}}
                                <input type='hidden' name='selectGroup' id='selectGroup'/>
                            </div>
                        </header>
                        <div class="body" id="collapse4">
                            <table id="ManageFormsInGroups" class="table table-bordered table-condensed table-hover table-striped">
                                <thead>
                                <tr>
                                    <th>Utility ID</th>
                                    <th data-class="expand">Utility Type Name</th>
                                    <th data-hide="phone">Description</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            {{*End of DataTables Grid Coding*}}
        </div>
    </div>
    {{*End of the Main Content View*}}

    {{*Hidden Models Below for Actions of the View*}}

{{/block}}
{{block name="scripts"}}

{{/block}}
