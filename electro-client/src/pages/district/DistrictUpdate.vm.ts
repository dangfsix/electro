import { useState } from 'react';
import { useForm, zodResolver } from '@mantine/form';
import DistrictConfigs from 'pages/district/DistrictConfigs';
import ProvinceConfigs from 'pages/province/ProvinceConfigs';
import { DistrictRequest, DistrictResponse } from 'models/District';
import { ProvinceResponse } from 'models/Province';
import { SelectOption } from 'types';
import useUpdateApi from 'hooks/use-update-api';
import useGetByIdApi from 'hooks/use-get-by-id-api';
import useGetAllApi from 'hooks/use-get-all-api';
import MiscUtils from 'utils/MiscUtils';

function useDistrictUpdateViewModel(id: number) {
  const updateApi = useUpdateApi<DistrictRequest, DistrictResponse>(DistrictConfigs.resourceUrl, id);
  const { data: districtResponse } = useGetByIdApi<DistrictResponse>(DistrictConfigs.resourceUrl, DistrictConfigs.resourceKey, id);
  const { data: provinceListResponse } = useGetAllApi<ProvinceResponse>(
    ProvinceConfigs.resourceUrl,
    ProvinceConfigs.resourceKey,
    { all: 1 }
  );

  const [district, setDistrict] = useState<DistrictResponse>();
  const [prevFormValues, setPrevFormValues] = useState<typeof form.values>();
  const [provinceSelectList, setProvinceSelectList] = useState<SelectOption[]>();

  const form = useForm({
    initialValues: DistrictConfigs.initialCreateUpdateFormValues,
    schema: zodResolver(DistrictConfigs.createUpdateFormSchema),
  });

  if (!district && districtResponse) {
    setDistrict(districtResponse);
    const formValues = {
      name: districtResponse.name,
      code: districtResponse.code,
      provinceId: String(districtResponse.province.id),
    };
    form.setValues(formValues);
    setPrevFormValues(formValues);
  }

  if (!provinceSelectList && provinceListResponse) {
    const selectList: SelectOption[] = provinceListResponse.content.map((item) => ({
      value: String(item.id),
      label: item.name,
    }));
    setProvinceSelectList(selectList);
  }

  const handleFormSubmit = form.onSubmit((formValues) => {
    setPrevFormValues(formValues);
    if (!MiscUtils.isEquals(formValues, prevFormValues)) {
      const requestBody: DistrictRequest = {
        name: formValues.name,
        code: formValues.code,
        provinceId: Number(formValues.provinceId),
      };
      updateApi.mutate(requestBody);
    }
  });

  return {
    district,
    form,
    handleFormSubmit,
    provinceSelectList,
  };
}

export default useDistrictUpdateViewModel;