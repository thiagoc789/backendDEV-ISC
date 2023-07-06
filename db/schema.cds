namespace app.evaluator;

using {managed} from '@sap/cds/common';

entity Season : managed {
    key id            : UUID;
        description   : String(1000);
        start_date    : Date;
        end_date      : Date;
        season_number : Integer;
        year          : Integer;
        month         : Integer;
        created_by    : String(100);
        status        : String(20);
}

entity Evaluation : managed {
    key id          : String(30);
        name        : String(200);
        description : String(1000);
        weight      : Decimal(5, 2);
}

entity EvaluationFormat : managed {
    key id            : UUID;
        id_evaluation : Association to Evaluation;
        metric        : String(200);
        description   : String(1000);
        weight        : Decimal;
}

entity EvaluationRecord : managed {
    key id              : UUID;
        id_evaluator    : Association to User;
        id_employee     : Association to User;
        evaluation_date : Date;
        month           : String(50);
        year            : String(50);
        id_evaluation   : Association to Evaluation;
        metric          : String(200);
        score           : Decimal;
        final_note      : Decimal;
        id_season       : Association to Season;
}

entity Attendance : managed {
    key id                       : Integer;
        id_employee              : Association to User;
        Role                     : String(100); // Assuming a maximum of 100 characters
        SeasonDays               : Integer;
        Weeks                    : Integer;
        Attendance               : Integer;
        SpecialMedicalDisability : Integer;
        SpecialPermissions       : Integer;
        Absence                  : Integer;
        Permission               : Integer;
        Disability               : Integer;
        Note                     : Decimal;
        date                     : Date;
}


entity Signature : managed {
    key id            : String(30);
        image         : String(1000);
        id_employee   : Association to User;
        date          : Date;
        id_evaluation : Association to Evaluation;
}


entity User : managed {
    key id_number  : Integer;
        name       : String(50);
        role       : String(30);
        department : String(30);
}

annotate User with @UI.LineItem: [

    {

        $Type: 'UI.DataField',
        Label: 'Identificación',
        Value: id_number

    },
    {

        $Type: 'UI.DataField',
        Label: 'Nombre',
        Value: name

    },
    {

        $Type: 'UI.DataField',
        Label: 'Departamento',
        Value: department

    },
    {

        $Type: 'UI.DataField',
        Label: 'Rol',
        Value: role

    }

];

annotate User with @UI.SelectionFields: [

    id_number,
    name,
    role,
    department

];


annotate Evaluation with @UI.LineItem: [

    {

        $Type: 'UI.DataField',
        Label: 'Id Evaluación',
        Value: id

    },
    {

        $Type: 'UI.DataField',
        Label: 'Nombre',
        Value: name

    },
    {

        $Type: 'UI.DataField',
        Label: 'Descripción',
        Value: description

    },
    {

        $Type: 'UI.DataField',
        Label: 'Peso',
        Value: weight

    },


];

annotate Evaluation with @UI.SelectionFields: [


];


entity Empleado : managed {
    key SAP_Number                   : Integer;
        First_Name                   : String(100);
        Last_Name                    : String(100);
        Gender                       : Integer;
        Birth_Date                   : Date;
        Document_Type                : String(100);
        Document_ID                  : String(100);
        Cedula_Ingenio               : String(100);
        Contract_Type                : String(100);
        Contract_Description         : String(100);
        Status                       : String(100);
        Labor_Relationship           : String(100);
        Position                     : String(100);
        Organizational_Key           : String(100);
        Labor_Rel_Description        : String(100);
        Position_Description         : String(100);
        Dependency_Description       : String(100);
        Admission_Reason             : String(100);
        Admission_Reason_Description : String(100);
        Admission_Date_From          : Date;
        Effective_Until              : Date;
        Discharge_Reason             : String(100);
        Discharge_Reason_Description : String(100);
        Discharge_Date_From          : Date;
        Effective_Until_Discharge    : Date;
        Service_Time                 : String(100);
}

annotate Empleado with @UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Label: 'Número SAP',
        Value: SAP_Number
    },
    {
        $Type: 'UI.DataField',
        Label: 'Nombre',
        Value: First_Name
    },
    {
        $Type: 'UI.DataField',
        Label: 'Apellido',
        Value: Last_Name
    },
    {
        $Type: 'UI.DataField',
        Label: 'Género',
        Value: Gender
    },
    {
        $Type: 'UI.DataField',
        Label: 'Fecha de Nacimiento',
        Value: Birth_Date
    },
    {
        $Type: 'UI.DataField',
        Label: 'Tipo de Documento',
        Value: Document_Type
    },
    {
        $Type: 'UI.DataField',
        Label: 'ID del Documento',
        Value: Document_ID
    },
    {
        $Type: 'UI.DataField',
        Label: 'Cédula Ingenio',
        Value: Cedula_Ingenio
    },
    {
        $Type: 'UI.DataField',
        Label: 'Tipo de Contrato',
        Value: Contract_Type
    },
    {
        $Type: 'UI.DataField',
        Label: 'Descripción del Contrato',
        Value: Contract_Description
    },
    {
        $Type: 'UI.DataField',
        Label: 'Estado',
        Value: Status
    },
    {
        $Type: 'UI.DataField',
        Label: 'Relación Laboral',
        Value: Labor_Relationship
    },
    {
        $Type: 'UI.DataField',
        Label: 'Posición',
        Value: Position
    },
    {
        $Type: 'UI.DataField',
        Label: 'Clave Organizacional',
        Value: Organizational_Key
    },
    {
        $Type: 'UI.DataField',
        Label: 'Descripción de la Relación Laboral',
        Value: Labor_Rel_Description
    },
    {
        $Type: 'UI.DataField',
        Label: 'Descripción de la Posición',
        Value: Position_Description
    },
    {
        $Type: 'UI.DataField',
        Label: 'Descripción de la Dependencia',
        Value: Dependency_Description
    },
    {
        $Type: 'UI.DataField',
        Label: 'Razón de Admisión',
        Value: Admission_Reason
    },
    {
        $Type: 'UI.DataField',
        Label: 'Descripción de la Razón de Admisión',
        Value: Admission_Reason_Description
    },
    {
        $Type: 'UI.DataField',
        Label: 'Fecha de Admisión',
        Value: Admission_Date_From
    },
    {
        $Type: 'UI.DataField',
        Label: 'Vigente Hasta',
        Value: Effective_Until
    },
    {
        $Type: 'UI.DataField',
        Label: 'Razón de Descargo',
        Value: Discharge_Reason
    },
    {
        $Type: 'UI.DataField',
        Label: 'Descripción de la Razón de Descargo',
        Value: Discharge_Reason_Description
    },
    {
        $Type: 'UI.DataField',
        Label: 'Fecha de Descargo',
        Value: Discharge_Date_From
    },
    {
        $Type: 'UI.DataField',
        Label: 'Vigente Hasta Descargo',
        Value: Effective_Until_Discharge
    },
    {
        $Type: 'UI.DataField',
        Label: 'Tiempo de Servicio',
        Value: Service_Time
    }

];

annotate Empleado with @UI.SelectionFields: [

    SAP_Number,
    First_Name,
    Last_Name,
    Document_ID,
    Cedula_Ingenio,
    Contract_Type,
    Contract_Description,
    Status,
    Labor_Relationship,
    Position,
    Organizational_Key,
    Labor_Rel_Description,
    Position_Description,
    Dependency_Description,
    Admission_Reason,
    Admission_Reason_Description


];
