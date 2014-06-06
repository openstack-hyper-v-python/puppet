node /buildserver.*/ {

    include jenkins
    jenkins::plugin {
        'git':  ;
        'git-client':   ;
        'github-api':   ;
        'github':   ;
    }
    class {'jenkins_job_builder:'}
    class {'mingw:'}
    
    # temporary solution to force posix_ipc to be built with mingw headers and not python-dev headers
    file_line { 'quoted-include':
        path    =>  "$(mgw_path_base)\\include\\process.h",
        match   =>  "#include <stdint.h>",
        line    =>  "#include \"stdint.h\""
        require =>  Class['mingw'],
    }
    
    class {'windows_git':}
    class {'visualcplusplus2008:'}
    class {'swig:'}
    class {'nasm':}
    class {'windows_openssl': 
        $openssl_path => 'C:\\pkg',
    }
    class {'mysql_windows':}
    class {'mysql_connector_c_windows':}
    class {'svn_windows':}
    
}