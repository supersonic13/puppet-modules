class opencv {
  #Installation - Folowing isntructions as on page:
  #http://docs.opencv.org/3.0-last-rst/doc/tutorials/introduction/linux_install/linux_install.html
  #Compiler
  package {"build-essential": ensure => present}
  
  #Required packages
  package {"unzip": ensure => present}
  package {"cmake": ensure => present}
  package {"git": ensure => present}
  package {"libgtk2.0-dev": ensure => present}
  package {"pkg-config": ensure => present}
  package {"libavcodec-dev": ensure => present}
  package {"libavformat-dev": ensure => present}
  package {"libswscale-dev": ensure => present}
  
  #Optional packages
  package {"python-dev": ensure => present}
  package {"python-numpy": ensure => present}
  package {"libtbb2": ensure => present}
  package {"libtbb-dev": ensure => present}
  package {"libjpeg-dev": ensure => present}
  package {"libpng-dev": ensure => present}
  package {"libtiff-dev": ensure => present}
  package {"libjasper-dev": ensure => present}
  package {"libdc1394-22-dev": ensure => present}
  
  #https://github.com/Itseez/opencv/archive/3.0.0.zip
  #Create the working directories
  file { "createWorkingDir":
    path    => "/home/vagrant/opencv",
    ensure  => "directory",
    owner   => "vagrant",
    group   => "vagrant",
    mode    => "0755",
  }
  file { "createWorkingSourceDir":
    path    => "/home/vagrant/opencv/source",
    ensure  => "directory",
    owner   => "vagrant",
    group   => "vagrant",
    mode    => "0755",
    require => File ["createWorkingDir"], 
  }
  file { "createWorkingOutputDir":
    path    => "/home/vagrant/opencv/build",
    ensure  => "directory",
    owner   => "vagrant",
    group   => "vagrant",
    mode    => "0755",
    require => File ["createWorkingDir"], 
  }
  
  exec {"getSourceCode":
    command => "wget https://github.com/Itseez/opencv/archive/3.0.0.zip",
    cwd     => "/home/vagrant/opencv",
    path    => ['/usr/local/sbin', '/usr/local/bin', '/usr/bin', '/bin', '/sbin'],
    require => File ["createWorkingSourceDir"], 
  }
  
  exec {"extractSourceCode":
    command => "unzip 3.0.0.zip -d source",
    cwd     => "/home/vagrant/opencv",
    path    => ['/usr/local/sbin', '/usr/local/bin', '/usr/bin', '/bin', '/sbin'], 
    require => Exec ["getSourceCode"],
  }
  
              
}
