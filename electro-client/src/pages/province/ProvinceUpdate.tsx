import React, { useEffect } from 'react';
import { Button, Divider, Group, Paper, SimpleGrid, Stack, TextInput } from '@mantine/core';
import { useParams } from 'react-router-dom';
import { CreateUpdateTitle, DefaultPropertyPanel } from 'components';
import ProvinceConfigs from 'pages/province/ProvinceConfigs';
import useProvinceUpdateViewModel from 'pages/province/ProvinceUpdate.vm';

export default function ProvinceUpdate() {
  const { id } = useParams();
  const { province, getProvince, form, handleFormSubmit } = useProvinceUpdateViewModel();

  useEffect(() => {
    void getProvince(id);
  }, [getProvince, id]);

  if (!province) {
    return null;
  }

  return (
    <Stack sx={{ maxWidth: 800 }}>
      <CreateUpdateTitle managerPath={ProvinceConfigs.managerPath} title={ProvinceConfigs.updateTitle}/>

      <DefaultPropertyPanel
        id={province.id}
        createdAt={province.createdAt}
        updatedAt={province.updatedAt}
        createdBy="1"
        updatedBy="1"
      />

      <form onSubmit={handleFormSubmit}>
        <Paper shadow="xs">
          <Stack spacing={0}>
            <SimpleGrid p="sm" spacing="md" breakpoints={[{ minWidth: 'xs', cols: 2 }]}>
              <TextInput
                required
                label={ProvinceConfigs.properties.name.label}
                {...form.getInputProps('name')}
              />
              <TextInput
                required
                label={ProvinceConfigs.properties.code.label}
                {...form.getInputProps('code')}
              />
            </SimpleGrid>

            <Divider mt="xs"/>

            <Group position="apart" p="sm">
              <Button variant="default" onClick={form.reset}>Tẩy trống</Button>
              <Button type="submit">Cập nhật</Button>
            </Group>
          </Stack>
        </Paper>
      </form>
    </Stack>
  );
}