namespace s4hext.cus_mat.srv;

using {OP_API_CUSTOMER_MATERIAL_SRV_0001 as standardAPI} from './external/OP_API_CUSTOMER_MATERIAL_SRV_0001';
// using schema as db from '../db/schema'
service CatalogService @(path:'CatalogService'){
    // @Capabilities.InsertRestrictions.Insertable: true
    entity MyCustomerMaterial as projection on standardAPI.A_CustomerMaterial{
    key Customer,
    key Material,
    key SalesOrganization,
    key DistributionChannel,
    MaterialByCustomer
    };
    // annotate MyCustomerMaterial with  @odata.draft.enabled;
    annotate CatalogService.MyCustomerMaterial with {
    Customer            @Common.Label: 'Customer';
    Material            @Common.Label: 'Material';
    SalesOrganization   @Common.Label: 'Sales Organization';
    DistributionChannel @Common.Label: 'Distribution Channel';
    MaterialByCustomer  @Common.Label: 'Material By Customer';

};
}
