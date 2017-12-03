Class EnvironmentManager
{
    GetVariable(EnvVarName)
    {
        EnvGet, OutputVar, %EnvVarName%
        if !OutputVar
        {
            MsgBox ,
            (LTrim
                Environment Variable Not Found: "%EnvVarName%".
                Click OK to set the variable.
            )
            FileSelectFolder, OutputVar
            MsgBox ,
            (LTrim
                "%EnvVarName%" has been set to %OutputVar%.
            )
            EnvSet, %EnvVarName%, %OutputVar%
            RegWrite, REG_EXPAND_SZ,HKCU, Environment, %EnvVarName%, %OutputVar%
        }
        return %OutputVar%
    }
}
