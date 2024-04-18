<h1>{{modeDesc}}</h1>
<form method="post"> action="index.php?page=Security_UsuarioForm&mode={{mode}}&usercod={{usercod}}">
    <input type="hidden" name="mode" value="{{mode}}">
    <input type="hidden" name="crf_token" value="{{crf_token}}">
    <input type="hidden" name="usercod" value="{{usercod}}">
    <div>
        <label for="{{usercod}}">usercod</label>
        <input type="text" name="usercod" id="{{usercod}}" value="{{usercod}}" {{isReadOnly}}>
    </div>
    <div>
        <label for="{{useremail}}">useremail</label>
        <input type="text" name="useremail" id="{{useremail}}" value="{{useremail}}" {{isReadOnly}}>
    </div>
    <div>
        <label for="{{username}}">username</label>
        <input type="text" name="username" id="{{username}}" value="{{username}}" {{isReadOnly}}>
    </div>
    <div>
        <label for="{{userpswd}}">userpswd</label>
        <input type="text" name="userpswd" id="{{userpswd}}" value="{{userpswd}}" {{isReadOnly}}>
    </div>
    <div>
        <label for="{{userfching}}">userfching</label>
        <input type="text" name="userfching" id="{{userfching}}" value="{{userfching}}" {{isReadOnly}}>
    </div>
    <div>
        <label for="{{userpswdest}}">userpswdest</label>
        <input type="text" name="userpswdest" id="{{userpswdest}}" value="{{userpswdest}}" {{isReadOnly}}>
    </div>
    <div>
        <label for="{{userpswdexp}}">userpswdexp</label>
        <input type="text" name="userpswdexp" id="{{userpswdexp}}" value="{{userpswdexp}}" {{isReadOnly}}>
    </div>
    <div>
        <label for="{{userest}}">userest</label>
        <input type="text" name="userest" id="{{userest}}" value="{{userest}}" {{isReadOnly}}>
    </div>
    <div>
        <label for="{{useractcod}}">useractcod</label>
        <input type="text" name="useractcod" id="{{useractcod}}" value="{{useractcod}}" {{isReadOnly}}>
    </div>
    <div>
        <label for="{{userpswdchg}}">userpswdchg</label>
        <input type="text" name="userpswdchg" id="{{userpswdchg}}" value="{{userpswdchg}}" {{isReadOnly}}>
    </div>
    <div>
        <label for="{{usertipo}}">usertipo</label>
        <input type="text" name="usertipo" id="{{usertipo}}" value="{{usertipo}}" {{isReadOnly}}>
    </div>
    <div>
        <input type="submit" value="Save" {{isReadOnly}}>
        <a href="index.php?page=Security_UsuarioList">Cancel</a>
    </div>
</form>