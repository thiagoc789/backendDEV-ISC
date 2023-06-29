namespace app.evaluator;

using {managed} from '@sap/cds/common';

entity Season : managed {
    key id            : UUID;
    description: String(1000);
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
        weight      : Decimal;
}

entity EvaluationFormat : managed {
    key id            : UUID ;
        id_evaluation : Association to Evaluation;
        metric        : String(200); 
        description   : String(1000); 
        weight        : Decimal;
}

entity EvaluationRecord : managed {
    key id            : UUID ;
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

    }

];

annotate Evaluation with @UI.SelectionFields: [

    
    name,
    weight

];


