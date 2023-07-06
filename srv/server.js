const cds = require("@sap/cds");
const cov2ap = require("@sap/cds-odata-v2-adapter-proxy");

cds.on("bootstrap", (app) => app.use(cov2ap()));

cds.on('bootstrap', app => app.use('/evaluations', async (req, res, next) => {
    if (req.method === 'GET') {
        const tx = cds.transaction(req);
        const result = await tx.run(cds.ql`SELECT * from app.evaluator.Evaluation`);
        
        // Calculate weightPercentage and add it to each evaluation.
        result.forEach(evaluation => {
            evaluation.weightPercentage = calculateWeightPercentage(evaluation.weight);
        });

        // Send the resulting array of evaluations.
        res.json(result);
    } else {
        next();
    }
}));

// Function to calculate the weight as a percentage. Replace this with your own logic.
function calculateWeightPercentage(weight) {
    // In this example, we simply convert the weight to a percentage by dividing it by the maximum possible weight.
    const maxWeight = 100;
    return (weight / maxWeight) * 100;
}

module.exports = cds.server; 



