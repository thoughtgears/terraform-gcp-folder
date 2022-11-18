package test

import (
	"testing"

	"github.com/stretchr/testify/assert"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestFolderModule(t *testing.T) {
	t.Parallel()

	examplesDir := "../example/folder"

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// Set the path to the Terraform code that will be tested.
		TerraformDir: examplesDir,
		Vars: map[string]interface{}{
			"folder_name": "test-folder",
		},
	})
	defer terraform.Destroy(t, terraformOptions)

	t.Logf("Running in %s", examplesDir)
	terraform.InitAndApply(t, terraformOptions)

	// Do assertions below
	folderName := terraform.Output(t, terraformOptions, "folder_name")
	assert.Equal(t, "test-folder", folderName)
}

func TestFolderModulePermissions(t *testing.T) {
	t.Parallel()

	examplesDir := "../example/folder"

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// Set the path to the Terraform code that will be tested.
		TerraformDir: examplesDir,
		Vars: map[string]interface{}{
			"folder_name": "test-folder-2",
			"permissions": map[string]interface{}{
				"roles/viewer": []string{"user:example@example.com"},
			},
		},
	})
	defer terraform.Destroy(t, terraformOptions)

	t.Logf("Running in %s", examplesDir)
	terraform.InitAndApply(t, terraformOptions)

	// Do assertions below
	folderName := terraform.Output(t, terraformOptions, "folder_name")
	assert.Equal(t, "test-folder-2", folderName)
}
