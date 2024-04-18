<h1>Usuario List</h1>
<table>
    <thead>
        <tr>
                <th>usercod</th>
                <th>useremail</th>
                <th>username</th>
                <th>userpswd</th>
                <th>userfching</th>
                <th>userpswdest</th>
                <th>userpswdexp</th>
                <th>userest</th>
                <th>useractcod</th>
                <th>userpswdchg</th>
                <th>usertipo</th>
        <th>
            <a href="index.php?page=Security_UsuarioForm&mode=INS">Add</a>
        </th>
        </tr>
    </thead>
    <tbody>
        {{foreach rows}}
            <tr>
                <td>{{usercod}}</td>
                <td>{{useremail}}</td>
                <td>{{username}}</td>
                <td>{{userpswd}}</td>
                <td>{{userfching}}</td>
                <td>{{userpswdest}}</td>
                <td>{{userpswdexp}}</td>
                <td>{{userest}}</td>
                <td>{{useractcod}}</td>
                <td>{{userpswdchg}}</td>
                <td>{{usertipo}}</td>
                <td>
                    <a href="index.php?page=Security_UsuarioForm&mode=DSP&usercod={{usercod}}">View</a>&nbsp;
                    <a href="index.php?page=Security_UsuarioForm&mode=UPD&usercod={{usercod}}">Update</a>&nbsp;
                    <a href="index.php?page=Security_UsuarioForm&mode=DEL&usercod={{usercod}}">Delete</a>
                </td>
            </tr>
        {{endfor rows}}
    </tbody>
</table>