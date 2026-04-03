const cds = require('@sap/cds');
const Logger=cds.log('CatalogService');
module.exports = cds.service.impl(async function(srv){
    // 'MyCustomerMaterial' this should be same in .cds file then only works
    const { MyCustomerMaterial } = this.entities;
    Logger.info('read function called');
    Logger.warn('warning');
    Logger.error('this error');
    var getAllCusMat = async function (){
        // Step 1: get the access of the standard class
        // 'opApiCustomerMaterialSrv0001' this standard name not user defined
        const { opApiCustomerMaterialSrv0001 } = require('./src/generated/OP_API_CUSTOMER_MATERIAL_SRV_0001');
        // Step 2: call the factory function
        const {customerMaterialApi} = opApiCustomerMaterialSrv0001();
        // Step 3: create req
        const MyCustomerMat= await customerMaterialApi.requestBuilder()
        .getAll().top(10)
        .select(
            customerMaterialApi.schema.CUSTOMER,
            customerMaterialApi.schema.DISTRIBUTION_CHANNEL,
            customerMaterialApi.schema.MATERIAL,
            customerMaterialApi.schema.SALES_ORGANIZATION,
            customerMaterialApi.schema.BASE_UNIT,
            customerMaterialApi.schema.MATERIAL_BY_CUSTOMER
        ).
        execute({
            "url":"http://122.162.240.164:8010",
            "username":"MOB2",
            "password":"hana@200"
            // destinationName: "S4D"
        });
        return MyCustomerMat;
    };

    srv.on('READ',MyCustomerMaterial,async(req)=>{
        return await getAllCusMat().then(
            myData => {
                // console.log(myData);
                let extractData=[];
                // loop through array
               
                myData.forEach(cus_mat=>{ 
                    extractData.push({
                        SalesOrganization:cus_mat.salesOrganization,
                        DistributionChannel:cus_mat.distributionChannel,
                        Customer:cus_mat.customer,
                        Material:cus_mat.material,
                        MaterialByCustomer:cus_mat.materialByCustomer
                        // BaseUnit:cus_mat.baseUnit
                    });
               
                });
                Logger.debug('Debugging data',extractData);
                return extractData;
            }
        )
    });
    //   srv.on('CREATE', MyCustomerMaterial, async (req) => {

    //     // Step 1: load generated SDK
    //     const { opApiCustomerMaterialSrv0001 } = require('./src/generated/OP_API_CUSTOMER_MATERIAL_SRV_0001');

    //     // Step 2: factory function
    //     const { customerMaterialApi } = opApiCustomerMaterialSrv0001();

    //     // Step 3: get data from UI (payload)
    //     const data = req.data;

    //     // Step 4: create entity instance
    //     const newEntity = customerMaterialApi.entityBuilder()
    //         .customer(data.CUSTOMER)
    //         .distributionChannel(data.DISTRIBUTION_CHANNEL)
    //         .material(data.MATERIAL)
    //         .salesOrganization(data.SALES_ORGANIZATION)
    //         // .baseUnit(data.BASE_UNIT)
    //         .materialByCustomer(data.MATERIAL_BY_CUSTOMER);

    //     try {
    //         // Step 5: execute CREATE (POST)
    //         const result = await customerMaterialApi
    //             .requestBuilder()
    //             .create(newEntity)
    //             .execute({
    //                 url: "http://122.162.240.164:8010",
    //                 username: "MOB2",
    //                 password: "hana@200"
    //                 // destinationName: "S4D"
    //             });

    //         return result;

    //     } catch (error) {
    //         // console.error(error);
    //         Logger.error(error);
    //         req.error(500, 'Error while creating Customer Material');
    //     }
    // });

    srv.on('CREATE', MyCustomerMaterial, async (req) => {

    const { opApiCustomerMaterialSrv0001 } = require('./src/generated/OP_API_CUSTOMER_MATERIAL_SRV_0001');
    const { customerMaterialApi } = opApiCustomerMaterialSrv0001();

    const data = req.data;
    Logger.info("Create 1",data);
    const newEntity = customerMaterialApi.entityBuilder()
        .customer(data.Customer)
        .distributionChannel(data.DistributionChannel)
        .material(data.Material)
        .salesOrganization(data.SalesOrganization)
        .build(); 
        // .materialByCustomer(data.MaterialByCustomer);
    Logger.info("Create newEntity",newEntity);

    try {
        const result = await customerMaterialApi
            .requestBuilder()
            .create(newEntity)
            .execute({
                url: "http://122.162.240.164:8010",
                username: "MOB2",
                password: "hana@200"
            });
    Logger.info("result in create method",result);
        return {
            Customer: result.customer,
            Material: result.material,
            SalesOrganization: result.salesOrganization,
            DistributionChannel: result.distributionChannel,
            MaterialByCustomer: result.materialByCustomer
        };

    } catch (error) {
        Logger.error(error);
        req.error(500, error.message);
    }
});
});
