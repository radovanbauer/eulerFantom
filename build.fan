using build
class Build : build::BuildPod
{
  new make()
  {
    podName = "eulerFantom"
    summary = "Solutions of Project Euler problems in the Fantom language (see http://fantom.org)"
    depends = ["sys 1.0", "util 1.0"]
    srcDirs = [`fan/`]
    resDirs = [`res/`]
  }
}
