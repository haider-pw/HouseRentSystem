{{$usr_selelect_tab=strtolower($this->session->userdata('activetb'))}}
{{*<pre>{{print_r($menus)}}</pre>*}}
{{if !empty($menus)}}
{{foreach $menus as $key => $row }}
{{if strtolower($row['TabName']) === $usr_selelect_tab}}
    {{if $row['ParentID'] == 0}}
        {{$Menu[$row['MenuOrder']]['Name'] = $row['MenuName']}}
        {{$Menu[$row['MenuOrder']]['FormName'] = $row['FormName']}}
        {{$Menu[$row['MenuOrder']]['FormPath'] = $row['FormPath']}}
        {{$Menu[$row['MenuOrder']]['FormCIPath'] = $row['FormCIPath']}}
        {{$Menu[$row['MenuOrder']]['MenuIcon'] = $row['MenuIcon']}}
        {{foreach $menus as $key => $subrow}}
            {{if $subrow['ParentID'] == $row['MenuID']}}
                {{$Menu[$row['MenuOrder']]['SubMenu'][$subrow['MenuOrder']]['SubName'] = $subrow['MenuName']}}
                {{$Menu[$row['MenuOrder']]['SubMenu'][$subrow['MenuOrder']]['SubFormName'] = $subrow['FormName']}}
                {{$Menu[$row['MenuOrder']]['SubMenu'][$subrow['MenuOrder']]['SubFormPath'] = $subrow['FormPath']}}
                {{$Menu[$row['MenuOrder']]['SubMenu'][$subrow['MenuOrder']]['SubFormCIPath'] = $subrow['FormCIPath']}}
            {{/if}}
        {{/foreach}}
    {{/if}}
    {{/if}}
{{/foreach}}

{{$var = ksort($Menu)}}
{{/if}}

<ul id="menu" class="collapse">
<li class="nav-header">Menu</li>
    <li class="nav-divider"></li>
    {{if !empty($menus)}}
    {{foreach $Menu as $MainMenu}}
  {{$FormCIPath = explode("/", $MainMenu['FormCIPath'])}}
        <li {{checkActiveClassMainMenu($FormCIPath[1])}}>
            {{if isset($MainMenu['SubMenu'])}}
            <a href="javascript:;">
                <i class="fa {{$MainMenu['MenuIcon']}}"></i>
                <span class="link-title">{{$MainMenu['Name']}}</span>
                <span class="fa arrow"></span>
            </a>
            {{else}}
                <a href="{{url}}{{$MainMenu['FormCIPath']}}">
                    <i class="fa {{$MainMenu['MenuIcon']}}"></i> {{$MainMenu['Name']}}</a>
            {{/if}}
            {{if isset($MainMenu['SubMenu'])}}
            <ul>
                {{$var = ksort($MainMenu['SubMenu'])}}
                {{foreach $MainMenu['SubMenu'] as $SubMenu}}
                    {{$FormCIPath = explode("/", $SubMenu['SubFormCIPath'])}}
                    <li {{checkActiveClassSubMenu($FormCIPath[2])}}>
                        <a href="{{url}}{{$SubMenu['SubFormCIPath']}}">
                            <i class="fa fa-angle-right"></i> {{$SubMenu['SubName']}}
                        </a>
                    </li>
                    {{/foreach}}
            </ul>
            {{/if}}
        </li>
    {{/foreach}}
    {{/if}}
</ul><!-- /#menu -->
