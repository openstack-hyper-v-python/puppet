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
    class {'windows_git':}
    class {'visualcplusplus2008:'}
    class {'swig:'}
    class {'nasm':}
    class {'windows_openssl': 
        $openssl_path => 'C:\\pkg',
    }
    class {'mysql_windows':}
    class {'mysql_connector_c_windows':}
    
}