using {app.evaluator as my} from '../db/schema';

service MyEvaluationsService {
    entity Season           as projection on my.Season;
    entity Evaluation       as projection on my.Evaluation;
    entity EvaluationFormat as projection on my.EvaluationFormat;
    entity EvaluationRecord as projection on my.EvaluationRecord;
    entity Attendances      as projection on my.Attendance;
    entity User             as projection on my.User;
    entity Signatures       as projection on my.Signature;
}
